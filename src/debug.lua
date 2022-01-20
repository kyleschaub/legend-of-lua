-- This file contains several functions for displaying debug data

local debug = {}

function debug:d()

    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 16, 16, 840, 220)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(fonts.debug)
    love.graphics.print("d1: " .. d1, 50, 32)
    love.graphics.print("d2: " .. d2, 50, 118)

end

function debug:playerPosition()

    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 16, 16, 660, 220)

    local px = player:getX()
    local py = player:getY()

    if px >= 0 then
        px = " " .. px
    end

    if py >= 0 then
        py = " " .. py
    end

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(fonts.debug)
    love.graphics.print("player.x: " .. px, 50, 32)
    love.graphics.print("player.y: " .. py, 50, 118)

end

return debug