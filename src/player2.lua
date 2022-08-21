player = world:newBSGRectangleCollider(234, 184, 12, 12, 3)
player.x = 0
player.y = 0
player.dir = "down"
player.dirX = 1
player.dirY = 1
player.scaleX = 1
player.speed = 90
player.animSpeed = 0.14
player.walking = false
player.animTimer = 0
player.health = 4
player.stunTimer = 0
player.invincible = 0 -- timer
player.bowRecoveryTime = 0.3
player.holdSprite = sprites.items.heart
player.attackDir = vector(1, 0)
player.comboCount = 0

-- 0 = Normal gameplay
-- 1 = Sword swing
-- 2 = Use (bomb)
-- 3 = Bow (3: bow drawn, 3.1: recover)
-- 4 = Hookshot (4: armed, 4.1: launching, 4.2: moving)
-- 10 = Damage stun
-- 11 = Hold item
-- 12 = Transition
player.state = -1

player:setCollisionClass("Player")
player:setFixedRotation(true)

player.grid = anim8.newGrid(19, 21, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())

player.animations = {}
player.animations.downRight = anim8.newAnimation(player.grid('1-2', 1), player.animSpeed)
player.animations.downLeft = anim8.newAnimation(player.grid('1-2', 1), player.animSpeed)
player.animations.upRight = anim8.newAnimation(player.grid('1-2', 2), player.animSpeed)
player.animations.upLeft = anim8.newAnimation(player.grid('1-2', 2), player.animSpeed)
player.animations.swordDownRight = anim8.newAnimation(player.grid('1-2', 1), player.animSpeed)
player.animations.swordDownLeft = anim8.newAnimation(player.grid('1-2', 1), player.animSpeed)
player.animations.swordUpRight = anim8.newAnimation(player.grid('1-2', 2), player.animSpeed)
player.animations.swordUpLeft = anim8.newAnimation(player.grid('1-2', 2), player.animSpeed)
player.animations.useDownRight = anim8.newAnimation(player.grid(2, 1), player.animSpeed)
player.animations.useDownLeft = anim8.newAnimation(player.grid(2, 1), player.animSpeed)
player.animations.useUpRight = anim8.newAnimation(player.grid(2, 2), player.animSpeed)
player.animations.useUpLeft = anim8.newAnimation(player.grid(2, 2), player.animSpeed)
player.animations.hold = anim8.newAnimation(player.grid(1, 1), player.animSpeed)

player.anim = player.animations.upLeft

function player:update(dt)
    if player.state == -1 or gamestate == 0 then return end

    if player.stunTimer > 0 then
        player.stunTimer = player.stunTimer - dt
    end
    if player.stunTimer < 0 then
        player.stunTimer = 0
        if player.state == 10 then
            player.state = 0
            player:setLinearVelocity(0, 0)
        end
    end
    if player.invincible > 0 then
        player.invincible = player.invincible - dt
    end

    if player.state == 0 then
    
        local dirX = 0
        local dirY = 0

        if pause.active then return end

        if love.keyboard.isDown("d") then
            dirX = 1
            player.dirX = 1
            --player.anim = player.animations.right
            player.dir = "right"
        end

        if love.keyboard.isDown("a") then
            dirX = -1
            player.dirX = -1
            --player.anim = player.animations.left
            player.dir = "left"
        end

        if love.keyboard.isDown("s") then
            dirY = 1
            player.dirY = 1
            --player.anim = player.animations.down
            player.dir = "down"
        end

        if love.keyboard.isDown("w") then
            dirY = -1
            player.dirY = -1
            --player.anim = player.animations.up
            player.dir = "up"
        end

        if dirY == 0 and dirX ~= 0 then
            player.dirY = 1
        end

        if player.dirX == 1 then
            if player.dirY == 1 then
                player.anim = player.animations.downRight
            else
                player.anim = player.animations.upRight
            end
        else
            if player.dirY == 1 then
                player.anim = player.animations.downLeft
            else
                player.anim = player.animations.upLeft
            end
        end

        local vec = vector(dirX, dirY):normalized() * player.speed
        player:setLinearVelocity(vec.x, vec.y)

        if dirX == 0 and dirY == 0 then
            player.walking = false
            player.anim:gotoFrame(1)
        else
            player.walking = true
        end

        if player.walking then
            player.anim:update(dt)
        end

        player:checkDamage()
        player:checkTransition()

        if data.keys and data.keys > 0 then
            if player:enter('Wall') then
                local w = player:getEnterCollisionData('Wall')
                if w.collider.type == "lockedDoor" then
                    w.collider.dead = true
                end
            end
        end

    elseif player.state >= 1 and player.state < 2 then

        player.animTimer = player.animTimer - dt

        if player.state == 1 then
            player:setLinearVelocity((player.attackDir*120):unpack())
        elseif player.state == 1.1 then
            player:setLinearVelocity(0, 0)
        end

        if player.animTimer < 0 then
            if player.state == 1 then
                player.state = 1.1
                player.anim:gotoFrame(2)
                -- animTimer for finished sword swing stance
                player.animTimer = 0.25
                effects:spawn("slice", player:getX(), player:getY()+1, player.attackDir)
                player:swordDamage()
            elseif player.state == 1.1 then
                player.state = 0
                player:resetAnimation(player.dir)
            end
        end

    elseif player.state == 2 or player.state == 3.1 then

        player:setLinearVelocity(0, 0)
        player.animTimer = player.animTimer - dt

        if player.animTimer < 0 then
            player.state = 0
            player:resetAnimation(player.dir)
        end
    
    elseif player.state == 3 then

        -- while drawing the bow back, always 'use' the item
        player:useItem(player.bowRecoveryTime)
    
    elseif player.state == 4 or player.state == 4.1 then

        -- while arming the hookshot, always 'use' the item
        player:useItem(1)

        if player.state == 4.1 and hookshot.state == -1 then
            if distanceBetween(player:getX(), player:getY(), hookshot.x, hookshot.y) < 12 then
                hookshot.state = 0
                player.state = 0
                player:resetAnimation(player.dir)
            end
        end

    elseif player.state == 4.2 then

        player:setX( player:getX() + (hookshot.dirVec.x * hookshot.speed * dt) )
        player:setY( player:getY() + (hookshot.dirVec.y * hookshot.speed * dt) )

    elseif player.state == 11 then -- got an item

        player.animTimer = player.animTimer - dt

        if player.animTimer < 0 then
            player.state = 0
            player:resetAnimation(player.dir)
        end
    
    elseif player.state == 11.1 then -- got an item (delay)

        player.animTimer = player.animTimer - dt

        if player.animTimer < 0 then
            player:gotItem(player.holdSprite)
        end

    elseif player.state == 12 then -- transition

        player:setLinearVelocity(0, 0)
        player:resetAnimation(player.dir)

    end

end

function player:draw()

    if player.stunTimer > 0 then
        love.graphics.setColor(223/255,106/255,106/255,1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    -- Sword sprite
    local swSpr = sprites.sword
    local swX = 0
    local swY = 0
    local swLayer = -1
    local arrowSpr = sprites.items.arrow
    local bowSpr = sprites.items.bow1
    local hookSpr = sprites.items.hookshotArmed
    if player.state == 3.1 or data.arrowCount < 1 then bowSpr = sprites.items.bow2 end
    if player.state == 4.1 or player.state == 4.2 then hookSpr = sprites.items.hookshotHandle end

    local swordRot = 0
    if player.state == 1.1 then
        local tempVec = 0
        if player.comboCount % 2 == 0 then
            tempVec = player.attackDir:rotated(math.pi/2)
        else
            tempVec = player.attackDir:rotated(math.pi/-2)
        end
        swordRot = math.atan2(tempVec.y, tempVec.x)
        swX = tempVec.x * 12
        swY = tempVec.y * 12

        if swY > 0 then
            swLayer = 1
        end
    end

    local px = player:getX()
    local py = player:getY()+1

    love.graphics.draw(sprites.playerShadow, px, py+6, nil, nil, nil, sprites.playerShadow:getWidth()/2, sprites.playerShadow:getHeight()/2)

    -- Sword 'down' finished
    if player.dir == "down" and player.state == 1.1 then
        --love.graphics.draw(swSpr, px+12.5, py+7, 0, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'up' windup
    if player.dir == "up" and player.state == 1 then
        --love.graphics.draw(swSpr, px+9.5, py+6.5, 0, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'up' finished
    if player.dir == "up" and player.state == 1.1 then
        --love.graphics.draw(swSpr, px-14, py+7, math.pi, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'right' finished
    if player.dir == "right" and player.state == 1.1 then
        --love.graphics.draw(swSpr, px+1, py-9, math.pi/-2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'left' finished
    if player.dir == "left" and player.state == 1.1 then
        --love.graphics.draw(swSpr, px-3, py-9, math.pi/-2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Bow 'up'
    if player.dir == "up" and (player.state == 3 or player.state == 3.1) then
        --love.graphics.draw(bowSpr, px-2, py-1, math.pi/-2, nil, nil, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if player.state == 3 and data.arrowCount > 0 then love.graphics.draw(arrowSpr, px-1, py-3, math.pi/-2, nil, nil, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
    end

    if player.state == 1.1 and swLayer == -1 then
        love.graphics.draw(swSpr, px+swX, py+swY, swordRot, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    player.anim:draw(sprites.playerSheet, player:getX(), player:getY()-2, nil, player.dirX, 1, 9.5, 10.5)

    if player.state == 1.1 and swLayer == 1 then
        love.graphics.draw(swSpr, px+swX, py+swY, swordRot, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'down' windup
    if player.dir == "down" and player.state == 1 then
        --love.graphics.draw(swSpr, px-7.5, py+6, math.pi, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'right' windup
    if player.dir == "right" and player.state == 1 then
        --love.graphics.draw(swSpr, px+1, py+13.5, math.pi/2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'left' windup
    if player.dir == "left" and player.state == 1 then
        --love.graphics.draw(swSpr, px-3, py+13.5, math.pi/2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Bow 'right'
    if player.dir == "right" and (player.state == 3 or player.state == 3.1) then
        love.graphics.draw(bowSpr, px+5.5, py+6.5, nil, nil, nil, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if player.state == 3 and data.arrowCount > 0 then love.graphics.draw(arrowSpr, px+2.5, py+6.5, nil, nil, nil, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
    end

    -- Bow 'left'
    if player.dir == "left" and (player.state == 3 or player.state == 3.1) then
        love.graphics.draw(bowSpr, px-7.5, py+6.5, nil, -1, 1, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if player.state == 3 and data.arrowCount > 0 then love.graphics.draw(arrowSpr, px-4.5, py+6.5, nil, -1, 1, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
    end

    -- Bow 'down'
    if player.dir == "down" and (player.state == 3 or player.state == 3.1) then
        love.graphics.draw(bowSpr, px, py+10.5, math.pi/2, nil, nil, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if player.state == 3 and data.arrowCount > 0 then love.graphics.draw(arrowSpr, px, py+11, math.pi/2, nil, nil, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
    end

    -- Hookshot 'right'
    if player.dir == "right" and (player.state == 4 or player.state == 4.1 or player.state == 4.2) then
        love.graphics.draw(hookSpr, px+8, py+7, nil, nil, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end

    -- Hookshot 'left'
    if player.dir == "left" and (player.state == 4 or player.state == 4.1 or player.state == 4.2) then
        love.graphics.draw(hookSpr, px-10, py+7, math.pi, nil, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end

    -- Hookshot 'down'
    if player.dir == "down" and (player.state == 4 or player.state == 4.1 or player.state == 4.2) then
        love.graphics.draw(hookSpr, px+2, py+13, math.pi/2, nil, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end

    if player.state == 11 then
        love.graphics.draw(player.holdSprite, player:getX(), player:getY()-18, nil, nil, nil, player.holdSprite:getWidth()/2, player.holdSprite:getHeight()/2)
    end

end

function player:checkDamage()
    if player:enter('Enemy') then
        local e = player:getEnterCollisionData('Enemy')
        player:hurt(0.5, e.collider:getX(), e.collider:getY())
    end

    if player:enter('Projectile') then
        local e = player:getEnterCollisionData('Projectile')
        e.collider.dead = true
        player:hurt(0.5, e.collider:getX(), e.collider:getY())
    end
end

function player:checkTransition()
    if player:enter('Transition') then
        local t = player:getEnterCollisionData('Transition')
        if t.collider.type == "instant" then
            triggerTransition(t.collider.id, t.collider.destX, t.collider.destY)
        else
            curtain:call(t.collider.id, t.collider.destX, t.collider.destY)
        end
        --triggerTransition(t.collider.id, t.collider.destX, t.collider.destY)
    end
end

function player:hurt(damage, srcX, srcY)
    if player.invincible > 0 then return end
    --player.invincible = 1 TODO: uncomment to enable invincibility frames
    player.health = player.health - damage
    player.state = 10 -- damaged
    player:setLinearVelocity((getFromToVector(srcX, srcY, player:getX(), player:getY()) * 300):unpack())
    player.stunTimer = 0.075
end

function player:swingSword()

    -- The player can only swing their sword if the player.state is 0 (regular gameplay)
    if player.state ~= 0 then return end

    player.comboCount = player.comboCount + 1

    player.attackDir = toMouseVector(player:getX(), player:getY())
    player:setDirFromVector(player.attackDir)

    player.state = 1

    if player.dirX == 1 then
        if player.dirY == 1 then
            player.anim = player.animations.swordDownRight
        else
            player.anim = player.animations.swordUpRight
        end
    else
        if player.dirY == 1 then
            player.anim = player.animations.swordDownLeft
        else
            player.anim = player.animations.swordUpLeft
        end
    end

    --player.anim:gotoFrame(1)
    -- animTimer for sword wind-up
    player.animTimer = 0.1

end

function player:swordDamage()
    -- Query for enemies to hit with the sword
    local hitEnemies = world:queryCircleArea(player:getX(), player:getY(), 24, {'Enemy'})
    for _,e in ipairs(hitEnemies) do
        local knockbackDir = getPlayerToSelfVector(e:getX(), e:getY())
        e.parent:hit(1, knockbackDir, 0.1)
    end
end

function player:useItem(duration)

    if player.state ~= 3 and player.state ~= 3.1 and player.state ~= 4 and player.state ~= 4.1 then
        player.state = 2
    end

    if player.dir == "down" then
        player.anim = player.animations.useDown
    elseif player.dir == "up" then
        player.anim = player.animations.useUp
    elseif player.dir == "right" then
        player.anim = player.animations.useRight
    elseif player.dir == "left" then
        player.anim = player.animations.useLeft
    end

    player.anim:gotoFrame(1)
    player.animTimer = duration

end

function player:useBomb()
    player:useItem(0.2)
    spawnBomb()
end

function player:useBoomerang()
    player:useItem(0.2)
    boomerang:throw(player.dir)
end

function player:useBow()
    if player.state == 0 then
        player.state = 3
        player:setLinearVelocity(0, 0)
    elseif player.state == 3 then
        player.state = 3.1
        spawnArrow(player.dir)
        player.animTimer = player.bowRecoveryTime
    end
end

function player:useHookshot()
    if player.state == 0 then
        player.state = 4
        player:setLinearVelocity(0, 0)
    elseif player.state == 4 then
        player.state = 4.1
        hookshot:shoot(player.dir)
        player.animTimer = player.bowRecoveryTime
    end
end

function player:resetAnimation(direction)
    --player.anim = player.animations[direction]
    if player.dirX == 1 then
        if player.dirY == 1 then
            player.anim = player.animations.downRight
        else
            player.anim = player.animations.upRight
        end
    else
        if player.dirY == 1 then
            player.anim = player.animations.downLeft
        else
            player.anim = player.animations.upLeft
        end
    end
    player.anim:gotoFrame(1)
end

function player:gotItem(spr, delay)
    if delay then
        player.state = 11.1
        player.animTimer = 0.5
        player.holdSprite = spr
        return
    end
    player.holdSprite = spr
    player.state = 11
    player.animTimer = 1
    player.dir = "down"
    player.anim = player.animations.hold
    player:setLinearVelocity(0, 0)
end

function player:interact()
    -- query for interactable walls
    local interactables = world:queryCircleArea(player:getX(), player:getY(), 12, {'Wall'})
    for _,i in ipairs(interactables) do
        if i.parent then
            i.parent:interact()
        end
    end
end

function player:setDirFromVector(vec)
    local rad = math.atan2(vec.y, vec.x)
    d1 = rad
    if rad >= 0 and rad < math.pi/2 then
        player.dirX = 1
        player.dirY = 1
    elseif rad >= math.pi/2 and rad < math.pi then
        player.dirX = -1
        player.dirY = 1
    elseif rad < 0 and rad > math.pi/-2 then
        player.dirX = 1
        player.dirY = -1
    else
        player.dirX = -1
        player.dirY = -1
    end
end