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

-- Returns the rotation needed for a given direction
function getRotationFromDir(direction)

    if direction == "right" then
        return 0
    elseif direction == "left" then
        return math.pi
    elseif direction == "up" then
        return math.pi/-2
    elseif direction == "down" then
        return math.pi/2
    else
        return 0
    end

end

function getRotationFromVector(vec)
    return math.atan2(vec.y, vec.x)
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end

function getPlayerToSelfVector(x, y)
    return vector(x - player:getX(), y - player:getY()):normalized()
end

function getSelfToPlayerVector(x, y)
    return vector(player:getX() - x, player:getY() - y):normalized()
end

function getFromToVector(fromX, fromY, toX, toY)
    return vector(toX - fromX, toY - fromY):normalized()
end

function toMouseVector(px, py)
    local mx, my = cam:mousePosition()
    return vector.new(mx-px, my-py):normalized()
end

function setWhite()
    love.graphics.setColor(1, 1, 1, 1)
end

function midpoint(x1, y1, x2, y2)
    local p = {}
    p.x = (x1+x2)/2;
    p.y = (y1+y2)/2;
    return p;
end

function updateTimer(v, dt)
    if v > 0 then
        v = v - dt
    elseif v < 0 then
        v = 0
    end
    return v
end

function getPerfectY(destY)
    local tileNum = math.floor(destY / 16)
    return (tileNum * 16) + 8.7
end

function secondsToTime(sec)
    local minutes = math.floor(sec/60)
    local seconds = math.floor(sec%60)
    if seconds < 10 then seconds = "0" .. seconds end
    return minutes .. ":" .. seconds
end

function dirToInt(dir)
    if dir == "up" then
        return -1
    elseif dir == "down" then
        return 1
    elseif dir == "right" then
        return 1
    elseif dir == "left" then
        return -1
    else
        return dir
    end
end

-- 'startswith' courtesy of StackOverflow
-- https://stackoverflow.com/questions/22831701/lua-read-beginning-of-a-string
string.startswith = function(self, str) 
    return self:find('^' .. str) ~= nil
end
