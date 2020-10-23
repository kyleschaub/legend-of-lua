sword = {}
sword.id = 0
sword.sprite = sprites.weapons.wooden_sword
sword.power = 1
sword.x = 0
sword.y = 0
sword.width = 96 -- AKA length of the sword
sword.height = 42 -- AKA thickness of the sword
sword.dir = "right"
sword.dirVector = vector(1, 0)
sword.rotation = 0

-- Sword states
-- 0: invisible, not being used
-- 1: stabbing out from Link
-- 2: peak distance pause
-- 3: retracting back to Link
sword.state = 0
sword.timer = 0

function sword:setStats()

    if sword.id == 0 then -- Wooden Sword
        sword.sprite = sprites.weapons.wooden_sword
        sword.power = 1
    elseif sword.id == 1 then -- White Sword
        sword.sprite = sprites.weapons.white_sword
        sword.power = 2
    elseif sword.id == 2 then -- Magic Rod
        sword.sprite = sprites.weapons.white_sword
        sword.power = 0
    end

    sword.width = sword.sprite:getWidth()
    sword.height = sword.sprite:getHeight()

end

function sword:attack()

    -- Cannot attack with a sword if the sword is already in use
    if sword.state > 0 then
        return
    end

    sword:setStats()
    sword.dir = player.dir
    sword.dirVector = getDirectionVector(sword.dir)
    sword.rotation = getRadianRotation(sword.dir)

    local adjX, adjY = getLinkFrontPosition(24)
    sword.x = adjX
    sword.y = adjY

    -- Adjust offset for particular directions
    if sword.dir == "right" or sword.dir == "left" then
        sword.y = sword.y + 8
    elseif sword.dir == "down" then
        sword.x = sword.x + 8
    elseif sword.dir == "up" then
        sword.x = sword.x - 8
    end

    sword.state = 1
    sword.timer = 0.07

end

function sword:update(dt)

    if sword.timer > 0 then
        sword.timer = sword.timer - dt
        if sword.timer < 0 then
            if sword.state == 1 then
                sword.state = 2
                sword.timer = 0.3
            elseif sword.state == 2 then
                sword.state = 3
                sword.timer = 0.07
                sword.dirVector:rotateInplace(math.pi)
            else
                sword.state = 0
            end
        end
    end

    if sword.state == 1 or sword.state == 3 then
        local dx, dy = (sword.dirVector * dt * 800):unpack()
        sword.x = sword.x + dx
        sword.y = sword.y + dy
    end

end

function sword:draw()
    if sword.state > 0 then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(sword.sprite, sword.x, sword.y, sword.rotation, 1, 1, sword.width/2, sword.height/2)
    end
end
