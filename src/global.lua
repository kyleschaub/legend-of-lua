-- Returns the x, y position that is in front of Link
-- "dist" number of pixels away
function getLinkFrontPosition(dist)

    local px, py = player:getPosition()

    if player.dir == "right" then
        px = px + dist
    elseif player.dir == "left" then
        px = px - dist
    elseif player.dir == "up" then
        py = py - dist
    elseif player.dir == "down" then
        py = py + dist
    end

    return px, py

end


-- Returns the radian equivalent for a given direction string
function getRadianRotation(direction)

    if direction == "right" then
        return 0
    elseif direction == "left" then
        return math.pi
    elseif direction == "up" then
        return (math.pi/2)*3
    elseif direction == "down" then
        return math.pi/2
    else
        return 0
    end

end


-- Returns the radian equivalent for a given direction string
function getDirectionVector(direction)

    if direction == "right" then
        return vector(1, 0)
    elseif direction == "left" then
        return vector(-1, 0)
    elseif direction == "up" then
        return vector(0, -1)
    elseif direction == "down" then
        return vector(0, 1)
    else
        return vector(1, 0)
    end

end
