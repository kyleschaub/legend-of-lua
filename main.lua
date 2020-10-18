function love.load()

    require("src/startup/gameStart")
    gameStart()

    score = 0
    loadMap("old-style-map")

end

function love.update(dt)

    player:update(dt)
    world:update(dt)

end

function love.draw()

    local debug = require "src/debug"

    cam:attach()

        -- Draw the background from the Tiled map
        gameMap:drawLayer(gameMap.layers["Background"])

        player:draw()

        love.graphics.setLineWidth(5)
        --world:draw()

    cam:detach()

    debug:playerDir()
    --player:drawHealth()

end

function love.keypressed(key)

    if key == "escape" then
        love.event.quit(0)
    end
    
    -- Resets the player's position to (0, 0)
    if key == "r" then
        player.collider:setPosition(0, 0)
        player.collider:setLinearVelocity(0, 0)
    end

    if key == 'space' then
        player:interact()
        player:useItem()
    end

end

function loadMap(mapName)
    gameMap = sti("maps/" .. mapName .. ".lua")
end
