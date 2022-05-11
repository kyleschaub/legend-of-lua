function love.load()
    math.randomseed(os.time())

    d1 = 0
    d2 = 0
    colliderToggle = false

    require("src/startup/gameStart")
    gameStart()
    createNewSave()

    loadMap("test7")
 
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

    --local debug = require "src/debug"
    --debug:d()
    --debug:single()
end

function love.keypressed(key)
    if key == 'q' then
        colliderToggle = not (colliderToggle and true);
    end

    if key == 'm' then
        curtain:call()
    end

    if key == 'o' then
        player.health = player.health - 0.5
    end

    if key == 'p' then
        player.health = player.health + 0.5
    end

    if key == 'l' then
        data.maxHealth = data.maxHealth + 1
    end

    if key == 'escape' then
        love.event.quit()
    end

    if key == 'z' then
        player:swingSword()
    end

    if key == 'x' then
        useItem()
    end

    if key == 'c' then
        spawnLoot(player:getX() + 16, player:getY(), "heart", true)
    end

    if key == 'lctrl' then
        data.item = data.item + 1
        if data.item > 3 then
            data.item = 1
        end
    end

    if key == 'lshift' or key == 'rshift' then
        player:interact()
    end
end

function love.keyreleased(key)
    if key == 'x' and data.item == 3 then
        useItem()
    end
end
