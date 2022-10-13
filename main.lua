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
        --colliderToggle = not (colliderToggle and true);
    end

    if key == 'escape' then
        if pause.active then
            pause:toggle()
        else
            love.event.quit()
        end
    end

    if key == 'backspace' then
        if fullscreen then
            local newWidth = 1920
            local newHeight = 1080
            local fractionW = love.graphics.getWidth()*0.9
            local fractionH = love.graphics.getHeight()*0.9
            if fractionW < newWidth then
                newWidth = fractionW
            end
            if fractionH < newHeight then
                newHeight = fractionH
            end

            setWindowSize(false, newWidth, newHeight)
        else
            setWindowSize(true)
        end
        reinitSize()
    end

    if key == 'r' then
        data.outfit = data.outfit + 1
        if data.outfit > 4 then data.outfit = 1 end
        sprites.playerSheet = love.graphics.newImage('sprites/player/playerSheet' .. data.outfit .. '.png')
    end

    if key == 'lshift' or key == 'rshift' then
        --player:interact()
    end

    if key == 'return' or key == 'tab' or key == 'e' then
        if gamestate == 1 then
            pause:toggle()
        end
    end

    if key == 'space' then
        player:roll()
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
            pause:equip('left')
        else
            if love.keyboard.isDown('lshift') then
                useItem('altL')
            else
                useItem('left')
            end
        end
    elseif button == 2 then
        if pause.active then
            pause:equip('right')
        else
            if love.keyboard.isDown('lshift') then
                useItem('altR')
            else
                useItem('right')
            end
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
