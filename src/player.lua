player = world:newBSGRectangleCollider(234, 184, 12, 12, 3)
player.x = 0
player.y = 0
player.dir = "down"
player.dirX = 1
player.dirY = 1
player.prevDirX = 1
player.prevDirY = 1
player.scaleX = 1
player.speed = 90
player.animSpeed = 0.14
player.walking = false
player.animTimer = 0
player.health = 4
player.stunTimer = 0
player.damagedTimer = 0
player.damagedBool = 1
player.damagedFlashTime = 0.05
player.invincible = 0 -- timer
player.bowRecoveryTime = 0.25
player.holdSprite = sprites.items.heart
player.attackDir = vector(1, 0)
player.comboCount = 0
player.aiming = false
player.arrowOffX = 0
player.arrowOffX = 0
player.bowVec = vector(1, 0)
player.baseDamping = 12
player.dustTimer = 0
player.rollDelayTimer = 0
player.rotateMargin = 0.25

-- 0 = Normal gameplay
-- 0.5 = Rolling
-- 1 = Sword swing
-- 2 = Use (bomb)
-- 3 = Bow (3: bow drawn, 3.1: recover)
-- 4 = grapple (4: armed, 4.1: launching, 4.2: moving)
-- 10 = Damage stun
-- 11 = Hold item
-- 12 = Transition
player.state = -1

player:setCollisionClass("Player")
player:setFixedRotation(true)
player:setLinearDamping(player.baseDamping)

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
player.animations.rollDown = anim8.newAnimation(player.grid('1-3', 4), 0.11)
player.animations.rollUp = anim8.newAnimation(player.grid('1-3', 5), 0.11)
player.animations.stopDown = anim8.newAnimation(player.grid('1-3', 6), 0.22, function() player.anim = player.animations.idleDown end)
player.animations.stopUp = anim8.newAnimation(player.grid('1-3', 7), 0.22, function() player.anim = player.animations.idleUp end)
player.animations.idleDown = anim8.newAnimation(player.grid('1-4', 8), {1.2, 0.1, 2.4, 0.1})
player.animations.idleUp = anim8.newAnimation(player.grid('1-2', 9), 0.22)

player.anim = player.animations.idleDown

player.buffer = {} -- input buffer

function player:update(dt)

    if pause.active then player.anim:update(dt) end
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
    
    if player.damagedTimer > 0 then
        player.damagedTimer = player.damagedTimer - dt
        player.damagedFlashTime = player.damagedFlashTime - dt
        if player.damagedFlashTime < 0 then
            player.damagedFlashTime = 0.05
            player.damagedBool = player.damagedBool * -1
        end
    end
    if player.damagedTimer < 0 then
        player.damagedTimer = 0
        --world:collisionClear()
        world:collisionEventsClear()
    end

    if player.rollDelayTimer > 0 then
        player.rollDelayTimer = player.rollDelayTimer - dt
    end

    if player.state == 0 then

        player:setLinearDamping(player.baseDamping)

        player.prevDirX = player.dirX
        player.prevDirY = player.dirY
    
        local dirX = 0
        local dirY = 0

        if pause.active then return end

        if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
            dirX = 1
            player.dirX = 1
        end

        if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
            dirX = -1
            player.dirX = -1
        end

        if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
            dirY = 1
            player.dirY = 1
        end

        if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
            dirY = -1
            player.dirY = -1
        end

        if dirY == 0 and dirX ~= 0 then
            player.dirY = 1
        end

        if data.item['left'] == "bow" then
            if love.mouse.isDown(1) then
                player.aiming = true
            elseif player.aiming then
                player:useBow()
                player:setDirFromVector(player.bowVec)
                return
            end
        end
        if data.item['right'] == "bow" then
            if love.mouse.isDown(2) then
                player.aiming = true
            elseif player.aiming then
                player:useBow()
                player:setDirFromVector(player.bowVec)
                return
            end
        end

        if player.aiming then
            player:setDirFromVector(player.bowVec)
        end

        if player.walking then
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
        end

        local vec = vector(dirX, dirY):normalized() * player.speed
        if vec.x ~= 0 or vec.y ~= 0 then
            player:setLinearVelocity(vec.x, vec.y)
        end

        if player.walking then
            player.dustTimer = player.dustTimer - dt
            if player.dustTimer < 0 then
                player.dustTimer = 0.22
                effects:spawn("walkDust", player:getX(), player:getY()+6, {dir = vec:normalized()})
            end
        else
            player.dustTimer = 0
        end

        if dirX == 0 and dirY == 0 then
            if player.walking then
                player.walking = false
                player:justStop()
            elseif player.aiming then
                local mvec = toMouseVector(player:getX(), player:getY())
                --if mvec.y < 0 then player.dirY = -1 end
                player:setDirFromVector(player.bowVec)
                player:justIdle()
            end
            --if player.aiming then player.anim:gotoFrame(1) end
        else
            player.walking = true
        end

        player.anim:update(dt)

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

        if player.animTimer > 0 then
            player.animTimer = player.animTimer - dt
            if player.animTimer < 0 then
                player.aiming = false
                player.animTimer = 0
            end
        end

    elseif player.state == 0.5 then

        player:checkTransition()
        player.anim:update(dt)

        player.animTimer = player.animTimer - dt
        if player.animTimer < 0 then
            player.state = 0
            player.animTimer = 0
            player.rollDelayTimer = 0.3
        end

    elseif player.state >= 1 and player.state < 2 then

        player.animTimer = player.animTimer - dt
        player:checkDamage()

        if player.state == 1 then
            player:setLinearVelocity((player.attackDir*90):unpack())
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
        player:checkDamage()
        if player.state == 2 then
            --player:setLinearVelocity(0, 0)
        end
        player.animTimer = player.animTimer - dt

        if player.animTimer < 0 then
            player.state = 0
            player:resetAnimation(player.dir)
            player.aiming = false
        end
    
    elseif player.state == 3 then

        -- while drawing the bow back, always 'use' the item
        player:useItem(player.bowRecoveryTime)
    
    elseif player.state == 4 or player.state == 4.1 then

        -- while arming the grapple, always 'use' the item
        -- player:useItem(1)

        if player.state == 4.1 and grapple.state == -1 then
            if distanceBetween(player:getX(), player:getY(), grapple.x, grapple.y) < 12 then
                grapple.state = 0
                player.state = 0
                player:resetAnimation(player.dir)
            end
        end

    elseif player.state == 4.2 then

        player:setX( player:getX() + (grapple.dir.x * grapple.speed * dt) )
        player:setY( player:getY() + (grapple.dir.y * grapple.speed * dt) )

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

    player:processBuffer(dt)

end

function player:draw()

    if player.stunTimer > 0 then
        love.graphics.setColor(223/255,106/255,106/255,1)
    elseif player.damagedTimer > 0 then
        local alpha = 0.8
        if player.damagedBool < 0 then alpha = 0.55 end
        love.graphics.setColor(1,1,1,alpha)
    else
        love.graphics.setColor(1,1,1,1)
    end

    -- Sword sprite
    local swSpr = sprites.items.sword
    local swX = 0
    local swY = 0
    local swLayer = -1
    local arrowSpr = sprites.items.arrow
    local bowSpr = sprites.items.bow1
    --local hookSpr = sprites.items.grappleArmed
    if player.aiming and (player.animTimer > 0 or data.arrowCount < 1) then bowSpr = sprites.items.bow2 end
    --if player.state == 4.1 or player.state == 4.2 then hookSpr = sprites.items.grappleHandle end

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

    local bowLayer = -1
    player.bowVec = toMouseVector(px, py)
    local bowScaleY = 1
    if player.bowVec.x < 0 then bowScaleY = -1 end
    local bowRot = math.atan2(player.bowVec.y, player.bowVec.x)
    local bowOffX = player.bowVec.x*6
    local bowOffY = player.bowVec.y*6
    local hookOffX = player.bowVec.x*6
    local hookOffY = player.bowVec.y*6
    player.arrowOffX = player.bowVec.x*6
    player.arrowOffY = player.bowVec.y*6

    if bowRot > -1 * player.rotateMargin or bowRot < (math.pi - player.rotateMargin) * -1 then
        bowLayer = 1
    end

    love.graphics.draw(sprites.playerShadow, px, py+5, nil, nil, nil, sprites.playerShadow:getWidth()/2, sprites.playerShadow:getHeight()/2)

    if player.state == 1.1 and swLayer == -1 then
        love.graphics.draw(swSpr, px+swX, py+swY, swordRot, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    if player.aiming and bowLayer == -1 then
        love.graphics.draw(bowSpr, px + bowOffX, py + bowOffY, bowRot, 1.15, bowScaleY, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if data.arrowCount > 0 and player.animTimer <= 0 then love.graphics.draw(arrowSpr, px + bowOffX, py + bowOffY, bowRot, 0.85, nil, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
        --love.graphics.draw(hookSpr, px + hookOffX, py + hookOffY, bowRot, 1.15, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end

    if player.stunTimer > 0 then love.graphics.setShader(shaders.whiteout) end

    player.anim:draw(sprites.playerSheet, player:getX(), player:getY()-2, nil, player.dirX, 1, 9.5, 10.5)

    love.graphics.setShader()

    if player.state == 1.1 and swLayer == 1 then
        love.graphics.draw(swSpr, px+swX, py+swY, swordRot, nil, nil, swSpr:getWidth()/2, swSpr:getHeight()/2)
    end

    if player.aiming and bowLayer == 1 then
        love.graphics.draw(bowSpr, px + bowOffX, py + bowOffY, bowRot, 1.15, bowScaleY, bowSpr:getWidth()/2, bowSpr:getHeight()/2)
        if data.arrowCount > 0 and player.animTimer <= 0 then love.graphics.draw(arrowSpr, px + bowOffX, py + bowOffY, bowRot, 0.85, nil, arrowSpr:getWidth()/2, arrowSpr:getHeight()/2) end
        --love.graphics.draw(hookSpr, px + hookOffX, py + hookOffY, bowRot, 1.15, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end

    if player.state == 11 then
        love.graphics.draw(player.holdSprite, player:getX(), player:getY()-18, nil, nil, nil, player.holdSprite:getWidth()/2, player.holdSprite:getHeight()/2)
    end

end

function player:checkDamage()
    if player.damagedTimer > 0 then return end

    local hitEnemies = world:queryCircleArea(player:getX(), player:getY(), 5, {'Enemy'})
    if #hitEnemies > 0 then
        local e = hitEnemies[1]
        if e.parent.dizzyTimer <= 0 and e.parent.stunTimer <= 0 then
            player:hurt(0.5, e:getX(), e:getY())
        end
    end

    -- to fix the overlap issue, check distance as well
    for _,e in ipairs(enemies) do
        if e.physics and distanceBetween(e.physics:getX(), e.physics:getY(), player:getX(), player:getY()) < 4 then
            player:hurt(0.5, e.physics:getX(), e.physics:getY())
        end
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
            curtain:call(t.collider.id, t.collider.destX, t.collider.destY, t.collider.type)
        end
        --triggerTransition(t.collider.id, t.collider.destX, t.collider.destY)
    end
end

function player:hurt(damage, srcX, srcY)
    if player.damagedTimer > 0 then return end
    player.damagedTimer = 2
    shake:start(0.1, 2, 0.03)
    particleEvent("playerHit", player:getX(), player:getY())
    dj.play(sounds.player.hurt, "static", "effect")
    player.health = player.health - damage
    player.state = 10 -- damaged
    player:setLinearVelocity((getFromToVector(srcX, srcY, player:getX(), player:getY()) * 300):unpack())
    player.stunTimer = 0.075
    player.aiming = false
end

function player:swingSword()

    -- The player can only swing their sword if the player.state is 0 (regular gameplay)
    if player.state ~= 0 then
        player:addToBuffer("sword")
        return
    end

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
    player.animTimer = 0.075

end

function player:swordDamage()
    -- Query for enemies to hit with the sword
    --local hitEnemies = world:queryCircleArea(player:getX(), player:getY(), 24, {'Enemy'})

    local px, py = player:getPosition()
    local dir = player.attackDir:normalized()
    local rightDir = dir:rotated(math.pi/2)
    local leftDir = dir:rotated(math.pi/-2)
    local polygon = {
        px + dir.x*20,
        py + dir.y*20,
        px + dir:rotated(math.pi/8).x*20,
        py + dir:rotated(math.pi/8).y*20,
        px + dir:rotated(math.pi/4).x*20,
        py + dir:rotated(math.pi/4).y*20,
        px + dir:rotated(3*math.pi/8).x*20,
        py + dir:rotated(3*math.pi/8).y*20,
        px + rightDir.x*22,
        py + rightDir.y*22,
        px + rightDir.x*22 + rightDir:rotated(math.pi/2).x*6,
        py + rightDir.y*22 + rightDir:rotated(math.pi/2).y*6,
        px + leftDir.x*22 + leftDir:rotated(math.pi/-2).x*6,
        py + leftDir.y*22 + leftDir:rotated(math.pi/-2).y*6,
        px + leftDir.x*22,
        py + leftDir.y*22,
        px + dir:rotated(3*math.pi/-8).x*20,
        py + dir:rotated(3*math.pi/-8).y*20,
        px + dir:rotated(math.pi/-4).x*20,
        py + dir:rotated(math.pi/-4).y*20,
        px + dir:rotated(math.pi/-8).x*20,
        py + dir:rotated(math.pi/-8).y*20,
    }

    local range = math.random()/4
    dj.play(sounds.items.sword, "static", "effect", 1, 1+range)

    local hitEnemies = world:queryPolygonArea(polygon, {'Enemy'})
    for _,e in ipairs(hitEnemies) do
        local knockbackDir = getPlayerToSelfVector(e:getX(), e:getY())
        e.parent:hit(1, knockbackDir, 0.1)
    end
end

function player:useItem(duration)

    if player.state ~= 3 and player.state ~= 3.1 and player.state ~= 4 and player.state ~= 4.1 then
        player.state = 2
        player:setLinearVelocity(0, 0)
    end

    --[[if player.dir == "down" then
        player.anim = player.animations.useDown
    elseif player.dir == "up" then
        player.anim = player.animations.useUp
    elseif player.dir == "right" then
        player.anim = player.animations.useRight
    elseif player.dir == "left" then
        player.anim = player.animations.useLeft
    end]]

    if player.dirX == 1 then
        if player.dirY == 1 then
            player.anim = player.animations.useDownRight
        else
            player.anim = player.animations.useUpRight
        end
    else
        if player.dirY == 1 then
            player.anim = player.animations.useDownLeft
        else
            player.anim = player.animations.useUpLeft
        end
    end

    player.anim:gotoFrame(1)
    player.animTimer = duration

end

function player:useBomb()
    if player.state ~= 0 then
        player:addToBuffer("bomb")
        return
    end

    player:useItem(0.2)
    spawnBomb()
end

function player:useBoomerang()
    if player.state ~= 0 then
        player:addToBuffer("boomerang")
        return
    end

    player:useItem(0.2)
    boomerang:throw(player.dir)
end

function player:useFire()
    if player.state ~= 0 then
        player:addToBuffer("fire")
        return
    end

    player:useItem(0.35)
    player:useSet()
    local oppDir = toMouseVector(player:getX(), player:getY()):rotated(math.pi)*80
    player:setLinearVelocity(oppDir.x, oppDir.y)
    spawnFlame(player:getX()-2, player:getY()-2)
end

function player:useBow()
    if player.state ~= 0 then
        player:addToBuffer("bow")
    end

    if player.state == 0 and data.arrowCount > 0 then
        if player.aiming and player.animTimer <= 0 then
            spawnArrow(player:getX() + player.arrowOffX, player:getY()+1+player.arrowOffY)
            local oppDir = toMouseVector(player:getX() + player.arrowOffX, player:getY()+1+player.arrowOffY):rotated(math.pi)*120
            player:setLinearVelocity(oppDir.x, oppDir.y)
            player.animTimer = player.bowRecoveryTime
            player.state = 3.1
            --player.aiming = false
        end
    end
end

function player:usegrapple()
    if player.state == 0 then
        player.state = 4.1
        player.attackDir = toMouseVector(player:getX() + player.arrowOffX, player:getY()+1+player.arrowOffY)
        player:useSet()
        grapple:shoot(player.attackDir)
        player:setLinearVelocity(0, 0)
        player:setDirFromVector(player.attackDir)
    end
end

function player:resetAnimation(direction)
    --player.anim = player.animations[direction]
    if player.dirX == 1 then
        if player.dirY == 1 then
            player.anim = player.animations.idleDown
        else
            player.anim = player.animations.idleUp
        end
    else
        if player.dirY == 1 then
            player.anim = player.animations.idleDown
        else
            player.anim = player.animations.idleUp
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

function player:roll()
    if player.state ~= 0 or player.rollDelayTimer > 0 then
        player:addToBuffer("roll")
        return
    end

    if pause.active then player:justIdle() return end

    local dirX = 0
    local dirY = 0

    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        dirX = 1
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        dirX = -1
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        dirY = 1
    end

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        dirY = -1
    end

    if dirX == 0 and dirY == 0 then return end -- must have some direction to roll

    player.state = 0.5
    player.animTimer = 0.3

    if dirY < 0 then
        player.anim = player.animations.rollUp
    else
        player.anim = player.animations.rollDown
    end
    player.anim:gotoFrame(1)

    player:setLinearDamping(1.75)
    local dirVec = vector(dirX, dirY):normalized()*160
    player:setLinearVelocity(dirVec.x, dirVec.y)

    local range = math.random()/5
    dj.play(sounds.player.roll, "static", "effect", 1, 1+range)
    effects:spawn("walkDust", player:getX(), player:getY()+6, {dir = dirVec, scale = 0.8})
    effects:spawn("walkDust", player:getX(), player:getY()+6, {dir = dirVec:rotated(math.pi/8), scale = 0.6})
    effects:spawn("walkDust", player:getX(), player:getY()+6, {dir = dirVec:rotated(math.pi/-8), scale = 0.6})
    effects:spawn("walkDust", player:getX(), player:getY()+6, {dir = dirVec:rotated(math.pi/4), scale = 0.6})
    effects:spawn("walkDust", player:getX(), player:getY()+6, {dir = dirVec:rotated(math.pi/-4), scale = 0.6})
end

function player:setDirFromVector(vec)
    local rad = math.atan2(vec.y, vec.x)
    if rad >= player.rotateMargin*-1 and rad < math.pi/2 then
        player.dirX = 1
        player.dirY = 1
    elseif (rad >= math.pi/2 and rad < math.pi) or (rad < (math.pi - player.rotateMargin)*-1) then
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

function player:useSet()
    local newDir = toMouseVector(player:getX(), player:getY())
    player:setDirFromVector(newDir)

    if player.dirX == 1 then
        if player.dirY == 1 then
            player.anim = player.animations.useDownRight
        else
            player.anim = player.animations.useUpRight
        end
    else
        if player.dirY == 1 then
            player.anim = player.animations.useDownLeft
        else
            player.anim = player.animations.useUpLeft
        end
    end
end

function player:justStop()
    if player.prevDirY < 0 then
        player.anim = player.animations.stopUp
    else
        player.anim = player.animations.stopDown
    end
    player.anim:gotoFrame(1)
end

function player:justIdle()
    if player.prevDirY < 0 then
        player.anim = player.animations.idleUp
    else
        player.anim = player.animations.idleDown
    end
    --player.anim:gotoFrame(1)
end

function player:processBuffer(dt)
    for i=#player.buffer,1,-1 do
        player.buffer[i][2] = player.buffer[i][2] - dt
    end
    for i=#player.buffer,1,-1 do
        if player.buffer[i][2] <= 0 then
            table.remove(player.buffer, i)
        end
    end

    if player.state == 0 then
        player:useBuffer()
    end
end

function player:addToBuffer(action)
    if action == "roll" and player.state == 0.5 then
        table.insert(player.buffer, {action, 0.1})
    else
        table.insert(player.buffer, {action, 0.25})
    end
end

function player:useBuffer()
    local action = nil
    if #player.buffer > 0 then
        action = player.buffer[1][1]
    end

    -- clear buffer
    for k,v in pairs(player.buffer) do player.buffer[k]=nil end

    if action == nil then return end

    if action == "sword" then
        player:swingSword()
    elseif action == "bow" then
        if not player:isBowButtonDown() then
            player.aiming = true
            player:useBow()
        end
    elseif action == "bomb" then
        player:useBomb()
    elseif action == "boomerang" then
        player:useBoomerang()
    elseif action == "fire" then
        player:useFire()
    elseif action == "roll" then
        player:roll()
    end
end

function player:isBowButtonDown()
    if data.item['z'] == 4 then -- bow
        if love.mouse.isDown(1) then
            return true
        end
    end
    if data.item['x'] == 4 then -- bow
        if love.mouse.isDown(2) then
            return true
        end
    end
    return false
end
