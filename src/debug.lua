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

function debug:single()

    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 16, 16, 1120, 165)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(fonts.debug)
    love.graphics.print("data.bombCount: " .. data.bombCount, 40, 22)

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

function debug:ammoCount()
    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 16, 16, love.graphics:getWidth()-32, 240)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(fonts.debug)
    love.graphics.print("bombCount: " .. data.bombCount, 50, 32)

end

return debug