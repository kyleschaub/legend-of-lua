player = world:newBSGRectangleCollider(230, 358, 12, 15, 3)
player.x = 0
player.y = 0
player.dir = "down"
player.speed = 90
player.animSpeed = 0.14
player.walking = false
player.animTimer = 0
player.health = 4
player.stunTimer = 0
player.invincible = 0 -- timer
player.bowRecoveryTime = 0.3
player.holdSprite = sprites.items.heart

-- 0 = Normal gameplay
-- 1 = Sword swing
-- 2 = Use (bomb)
-- 3 = Bow (3: bow drawn, 3.1: recover)
-- 10 = Damage stun
-- 11 = Hold item
-- 12 = Transition
player.state = 0

player:setCollisionClass("Player")
player:setFixedRotation(true)

player.grid = anim8.newGrid(16, 24, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())

player.animations = {}
player.animations.down = anim8.newAnimation(player.grid('1-4', 1), player.animSpeed)
player.animations.up = anim8.newAnimation(player.grid('1-4', 2), player.animSpeed)
player.animations.right = anim8.newAnimation(player.grid('1-4', 3), player.animSpeed)
player.animations.left = anim8.newAnimation(player.grid('1-4', 4), player.animSpeed)
player.animations.swordDown = anim8.newAnimation(player.grid('1-2', 5), player.animSpeed)
player.animations.swordUp = anim8.newAnimation(player.grid('1-2', 6), player.animSpeed)
player.animations.swordRight = anim8.newAnimation(player.grid('1-2', 7), player.animSpeed)
player.animations.swordLeft = anim8.newAnimation(player.grid('1-2', 8), player.animSpeed)
player.animations.useDown = anim8.newAnimation(player.grid(3, 5), player.animSpeed)
player.animations.useUp = anim8.newAnimation(player.grid(3, 6), player.animSpeed)
player.animations.useRight = anim8.newAnimation(player.grid(3, 7), player.animSpeed)
player.animations.useLeft = anim8.newAnimation(player.grid(3, 8), player.animSpeed)
player.animations.hold = anim8.newAnimation(player.grid(1, 9), player.animSpeed)

player.anim = player.animations.down

player:setLinearVelocity(-100, 0)

function player:update(dt)

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

        if love.keyboard.isDown("right") then
            dirX = 1
            player.anim = player.animations.right
            player.dir = "right"
        end

        if love.keyboard.isDown("left") then
            dirX = -1
            player.anim = player.animations.left
            player.dir = "left"
        end

        if love.keyboard.isDown("down") then
            dirY = 1
            player.anim = player.animations.down
            player.dir = "down"
        end

        if love.keyboard.isDown("up") then
            dirY = -1
            player.anim = player.animations.up
            player.dir = "up"
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

    elseif player.state >= 1 and player.state < 2 then

        player:setLinearVelocity(0, 0)
        player.animTimer = player.animTimer - dt

        if player.animTimer < 0 then
            if player.state == 1 then
                player.state = 1.1
                player.anim:gotoFrame(2)
                -- animTimer for finished sword swing stance
                player.animTimer = 0.25
                effects:spawn("slice", player:getX(), player:getY())
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
    local arrowSpr = sprites.items.arrow
    local bowSpr = sprites.items.bow1
    if player.state == 3.1 or data.arrowCount < 1 then bowSpr = sprites.items.bow2 end

    local px = player:getX()+1
    local py = player:getY()-5

    -- Sword 'down' finished
    if player.dir == "down" and player.state == 1.1 then
        love.graphics.draw(swSpr, px+12.5, py+7, 0, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'up' windup
    if player.dir == "up" and player.state == 1 then
        love.graphics.draw(swSpr, px+9.5, py+6.5, 0, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'up' finished
    if player.dir == "up" and player.state == 1.1 then
        love.graphics.draw(swSpr, px-14, py+7, math.pi, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'right' finished
    if player.dir == "right" and player.state == 1.1 then
        love.graphics.draw(swSpr, px+1, py-9, math.pi/-2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'left' finished
    if player.dir == "left" and player.state == 1.1 then
        love.graphics.draw(swSpr, px-3, py-9, math.pi/-2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Bow 'up'
    if player.dir == "up" and (player.state == 3 or player.state == 3.1) then
        --love.graphics.draw(bowSpr, px-2, py-1, math.pi/-2, nil, nil, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if player.state == 3 and data.arrowCount > 0 then love.graphics.draw(arrowSpr, px-1, py-3, math.pi/-2, nil, nil, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
    end

    player.anim:draw(sprites.playerSheet, player:getX(), player:getY()-2, nil, nil, nil, 8, 12)

    -- Sword 'down' windup
    if player.dir == "down" and player.state == 1 then
        love.graphics.draw(swSpr, px-7.5, py+6, math.pi, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'right' windup
    if player.dir == "right" and player.state == 1 then
        love.graphics.draw(swSpr, px+1, py+13.5, math.pi/2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    -- Sword 'left' windup
    if player.dir == "left" and player.state == 1 then
        love.graphics.draw(swSpr, px-3, py+13.5, math.pi/2, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
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

    if player.state == 11 then
        love.graphics.draw(player.holdSprite, player:getX(), player:getY()-18, nil, nil, nil, player.holdSprite:getWidth()/2, player.holdSprite:getHeight()/2)
    end

end

function player:checkDamage()
    if player:enter('Enemy') then
        local e = player:getEnterCollisionData('Enemy')
        player:hurt(0.5, e.collider:getX(), e.collider:getY())
    end
end

function player:checkTransition()
    if player:enter('Transition') then
        local t = player:getEnterCollisionData('Transition')
        curtain:call(t.collider.id, t.collider.destX, t.collider.destY)
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

    player.state = 1

    if player.dir == "down" then
        player.anim = player.animations.swordDown
    elseif player.dir == "up" then
        player.anim = player.animations.swordUp
    elseif player.dir == "right" then
        player.anim = player.animations.swordRight
    elseif player.dir == "left" then
        player.anim = player.animations.swordLeft
    end

    player.anim:gotoFrame(1)
    -- animTimer for sword wind-up
    player.animTimer = 0.1

end

function player:swordDamage()
    -- Query for enemies to hit with the sword
    local hitEnemies = world:queryCircleArea(player:getX(), player:getY(), 24, {'Enemy'})
    for _,e in ipairs(hitEnemies) do
        local knockbackDir = getPlayerToSelfVector(e:getX(), e:getY())
        e.parent:hit(1, knockbackDir, 0.2)
    end
end

function player:useItem(duration)

    if player.state ~= 3 and player.state ~= 3.1 then
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

function player:resetAnimation(direction)
    player.anim = player.animations[direction]
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
