menu = {}

function menu:draw()
    if gamestate == 0 then
        love.graphics.setFont(fonts.pause1)
        love.graphics.setColor(1, 1, 1, 1)

        --love.graphics.printf("1.  File #1", love.graphics.getWidth()/2 - 4000, 20 * scale, 8000, "center")
        --love.graphics.printf("2.  File #2", love.graphics.getWidth()/2 - 4000, 30 * scale, 8000, "center")
        --love.graphics.printf("3.  File #3", love.graphics.getWidth()/2 - 4000, 40 * scale, 8000, "center")

        love.graphics.printf("Use WASD or Arrow Keys to move.", love.graphics.getWidth()/2 - 4000, 20 * scale, 8000, "center")
        love.graphics.printf("Press Enter to equip items.", love.graphics.getWidth()/2 - 4000, 30 * scale, 8000, "center")
        love.graphics.printf("Use the mouse to aim and attack.", love.graphics.getWidth()/2 - 4000, 40 * scale, 8000, "center")
        love.graphics.printf("Press any key to start!", love.graphics.getWidth()/2 - 4000, 60 * scale, 8000, "center")
    end
end

function menu:select(key)
    if gamestate == 0 then

        startFresh(1)

        if data.map and string.len(data.map) > 0 then
            curtain:call(data.map, data.playerX, data.playerY, "fade")
        end

        return

    end

    -- Testing destinations (be sure to remove!)
    if key == "1" then
        loadMap("test")
    elseif key == "2" then
        loadMap("test5")
    elseif key == "3" then
        loadMap("test2")
    elseif key == "4" then
        loadMap("testDungeon2", 408, 494)
    end
end
