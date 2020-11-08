-- Link's collider
player = world:newCircleCollider(1300, 800, 40)
player:setCollisionClass("Player")

-- Player properties
player.width = 96  -- width of the animation frames
player.height = 96  -- height of the animation frames
player.speed = 360
player.isMoving = false
player.dir = "down"
player.item = 2 -- number corresponds to some item

-- Player can be in many states:
-- 0: normal, walking state
-- 1: attacking
-- 2: found item
player.state = 0
player.timer = 0

-- Health; Player starts at full hearts
player.max_hearts = 3
player.hearts = player.max_hearts

player.grids = {}
player.grids.walk = anim8.newGrid(player.width, player.height, sprites.linkWalkSheet:getWidth(), sprites.linkWalkSheet:getHeight(), 0, 0, 6)

player.animations = {}
player.animations.walkDown = anim8.newAnimation(player.grids.walk('1-2', 1), 0.1)
player.animations.walkRight = anim8.newAnimation(player.grids.walk('1-2', 2), 0.125)
player.animations.walkLeft = anim8.newAnimation(player.grids.walk('1-2', 2), 0.125)
player.animations.walkUp = anim8.newAnimation(player.grids.walk('1-2', 3), 0.1)

player.holdSprite = sprites.weapons.wooden_sword

player.weaponType = ""
player.weaponId = 0
player.weaponTag = 0

function playerAttackComplete()

    -- state 1 is standard attack animation
    if player.state == 1 then
        player.state = 0
        if player.dir == "down" then
            player.anim = player.animations.walkDown
        elseif player.dir == "left" then
            player.anim = player.animations.walkLeft
        elseif player.dir == "right" then
            player.anim = player.animations.walkRight
        elseif player.dir == "up" then
            player.anim = player.animations.walkUp
        end
        player.anim:gotoFrame(1) -- go to standing frame
    end

end

player.animations.attackDown = anim8.newAnimation(player.grids.walk(2,1, 3,1, 2,1), {0.07, 0.3, 0.07}, playerAttackComplete)
player.animations.attackRight = anim8.newAnimation(player.grids.walk(2,2, 3,2, 2,2), {0.07, 0.3, 0.07}, playerAttackComplete)
player.animations.attackLeft = anim8.newAnimation(player.grids.walk(2,2, 3,2, 2,2), {0.07, 0.3, 0.07}, playerAttackComplete)
player.animations.attackUp = anim8.newAnimation(player.grids.walk(2,3, 3,3, 2,3), {0.07, 0.3, 0.07}, playerAttackComplete)

-- This value stores the player's current animation
player.anim = player.animations.walkDown

function player:update(dt)

    if player.timer > 0 then
        player.timer = player.timer - dt
        if player.timer < 0 then
            -- Found Item state
            if player.state == 2 then
                player.state = 0
            end
        end
    end

    -- State 0: normal state, walking around
    if player.state == 0 then

        -- Freeze the animation if the player isn't moving
        if player.isMoving then
            player.anim:update(dt)
        end

        local vectorX = 0
        local vectorY = 0

        -- Keyboard direction checks for movement
        if love.keyboard.isDown("left") then
            vectorX = -1
            player.anim = player.animations.walkLeft
            player.dir = "left"
        end
        if love.keyboard.isDown("right") then
            vectorX = 1
            player.anim = player.animations.walkRight
            player.dir = "right"
        end
        if love.keyboard.isDown("up") then
            vectorY = -1
            player.anim = player.animations.walkUp
            player.dir = "up"
        end
        if love.keyboard.isDown("down") then
            vectorY = 1
            player.anim = player.animations.walkDown
            player.dir = "down"
        end

        player:setLinearVelocity(vectorX * player.speed, vectorY * player.speed)

        -- Check if player is moving
        if vectorX == 0 and vectorY == 0 then
            player.isMoving = false
            player.anim:gotoFrame(1) -- go to standing frame
        elseif not player.isMoving then
            player.isMoving =  true
            player.anim:gotoFrame(2)
        end

        if love.keyboard.isDown("h") then
            player.hello = true
        else
            player.hello = false
        end

    elseif player.state == 1 then
        player.anim:update(dt)
    elseif player.state == 2 then
        player.isMoving = false
        player:setLinearVelocity(0, 0)
    end

    player:searchForItems()

end

function player:draw()

    love.graphics.setColor(1,1,1,1)

    local px = player:getX()
    local py = player:getY()

    -- sx represents the scale on the x axis for the player animation
    -- If it is -1, the animation will flip horizontally (for walking left)
    local sx = 1
    if player.anim == player.animations.walkLeft or player.anim == player.animations.attackLeft then
        sx = -1
    end

    if player.state == 0 or player.state == 1 then
        -- Draw the player's walk animation
        love.graphics.setColor(1, 1, 1, 1)
        --love.graphics.draw(sprites.linkWalkSheet, px, py - 182, nil, nil, nil, sprites.hello:getWidth()/2, sprites.hello:getHeight()/2)
        player.anim:draw(sprites.linkWalkSheet, px, py, nil, sx, 1, player.width/2, player.height/2)
    elseif player.state == 2 then
        love.graphics.draw(sprites.linkGet, px, py, nil, nil, 1, player.width/2, player.height/2)
        love.graphics.draw(player.holdSprite, px - 34, py - 46, 3*math.pi/2, nil, 1, 4, player.holdSprite:getHeight()/2)
    end

    if player.hello then
        love.graphics.draw(sprites.hello, px, py - 182, nil, nil, nil, sprites.hello:getWidth()/2, sprites.hello:getHeight()/2)
    end

end

function player:equipWeapon(type, id, tag)

    player.weaponType = type
    player.weaponId = id
    player.weaponTag = tag

end

function player:attack()

    if gamestate ~= 0 then
        return
    end

    if player.state == 0 then
        player.state = 1
        player:setLinearVelocity(0, 0)
        if player.dir == "down" then
            player.anim = player.animations.attackDown
        elseif player.dir == "left" then
            player.anim = player.animations.attackLeft
        elseif player.dir == "right" then
            player.anim = player.animations.attackRight
        elseif player.dir == "up" then
            player.anim = player.animations.attackUp
        end

        if player.weaponTag ~= 0 then
            if player.weaponType == "sword" then
                sword:attack(player.weaponId)
            end
        end
    end

end

-- searches nearby items to pick up
function player:searchForItems()

    for i,a in ipairs(items) do
        if distanceBetween(player:getX(), player:getY(), a.x, a.y) < 45 then
            player.state = 2
            player.holdSprite = a.sprite
            player.timer = 0.85
            a.collected = true

            if a.type == "sword" then
                addWeapon(a.type, a.id)
            end
        end
    end

end

-- Draws the hearts to the upper-left corner of the screen
function player:drawHealth()

    local width = sprites.heart_filled:getWidth() + 10
    
    for i=1, player.max_hearts do
    
        local offset = (i-1) * width
        local heartSprite = sprites.heart_filled

        if i > player.hearts then
            heartSprite = sprites.heart_empty
        end

        if player.hearts - i == -0.5 then
            heartSprite = sprites.heart_half
        end

        love.graphics.draw(heartSprite, 10 + offset, 10)
        
    end

end
