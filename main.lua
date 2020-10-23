function love.load()

    require("src/startup/gameStart")
    gameStart()

    score = 0
    loadMap("old-style-map")

end

function love.update(dt)

    player:update(dt)
    sword:update(dt)
    world:update(dt)

end

function love.draw()

    local debug = require "src/debug"

    cam:attach()

        -- Draw the background from the Tiled map
        gameMap:drawLayer(gameMap.layers["Background"])

        sword:draw()
        player:draw()

        love.graphics.setLineWidth(5)
        --world:draw()

    cam:detach()

    --debug:playerDir()
    --player:drawHealth()

end

function love.keypressed(key)

    if key == "escape" then
        love.event.quit(0)
    end

    if key == 'z' then
        player:attack()
    end

    if key == 'space' then
        player:interact()
        player:useItem()
    end

end

function loadMap(mapName)
    gameMap = sti("maps/" .. mapName .. ".lua")
end
