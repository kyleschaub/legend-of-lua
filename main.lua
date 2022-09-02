function love.load()
    math.randomseed(os.time())

    d1 = 0
    d2 = 0
    colliderToggle = false

    require("src/startup/gameStart")
    gameStart()
    createNewSave()

    loadMap("menu")
 
    dj.volume("effect", 1)

end

function love.update(dt)
    updateAll(dt)
end

function love.draw()
    drawBeforeCamera()

    cam:attach()
        drawCamera()
        if colliderToggle then
            world:draw()
            particleWorld:draw()
        end
    cam:detach()

    drawAfterCamera()

    local debug = require "src/debug"
    --debug:d()
    --debug:single()
end

function love.keypressed(key)
    if key == 'q' then
        colliderToggle = not (colliderToggle and true);
        data.arrowCount = 100
    end

    if key == 'escape' then
        love.event.quit()
    end

    if key == 'z' then
        if pause.active then
            pause:equip('z')
        else
            useItem('z')
        end
    end

    if key == 'x' then
        if pause.active then
            pause:equip('x')
        else
            useItem('x')
        end
    end

    if key == 'c' then
        --particleEvent("death", player:getX(), player:getY())
        
    end

    if key == 'lctrl' then
        data.item.x = data.item.x + 1
        if data.item.x > 3 then
            data.item.x = 1
        end
    end

    if key == 'lshift' or key == 'rshift' then
        player:interact()
    end

    if key == 'return' then
        pause:toggle()
    end

    if key == 'space' then
        player:roll()
    end

    if key == 'right' and pause.active then
        pause.gridX = pause.gridX + 1
    end

    if key == 'left' and pause.active then
        pause.gridX = pause.gridX - 1
    end

    if key == 'up' and pause.active then
        pause.gridY = pause.gridY - 1
    end

    if key == 'down' and pause.active then
        pause.gridY = pause.gridY + 1
    end

    if key == 'n' then
        saveGame()
    end

    menu:select(key)
end

function love.keyreleased(key)
    if pause.active then return end
    if key == 'z' then
        useItem('z', true)
    elseif key == 'x' then
        useItem('x', true)
    end
end

function love.mousepressed( x, y, button )
    if button == 1 then
        if pause.active then
            pause:equip('z')
        else
            useItem('z')
        end
    elseif button == 2 then
        if pause.active then
            pause:equip('x')
        else
            useItem('x')
        end
    end
end

function love.mousereleased( x, y, button )
    if button == 1 then
        if pause.active then
            --pause:equip('z')
        else
            useItem('z', true)
        end
    elseif button == 2 then
        if pause.active then
            --pause:equip('x')
        else
            useItem('x', true)
        end
    end
end
