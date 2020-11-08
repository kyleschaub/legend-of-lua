function love.load()

    require("src/startup/gameStart")
    gameStart()

    score = 0
    loadMap("old-style-map")

    spawnItem("sword", 1, 800, 650)
    spawnItem("sword", 0, 1000, 650)
    spawnItem("sword", 2, 1200, 650)
    spawnItem("sword", 1, 1400, 650)
    spawnItem("sword", 0, 1600, 650)
    spawnItem("sword", 2, 1800, 650)

end

function love.update(dt)

    if gamestate == 0 then
        player:update(dt)
        sword:update(dt)
        world:update(dt)
        items:update()
    end
    flux.update(dt)

end

function love.draw()

    local debug = require "src/debug"

    cam:attach()

        -- Draw the background from the Tiled map
        love.graphics.setColor(1,1,1,1)
        gameMap:drawLayer(gameMap.layers["Background"])

        drawItems()
        sword:draw()
        player:draw()

        love.graphics.setLineWidth(5)
        --world:draw()

    cam:detach()

    weaponUi:draw()

    --debug:playerDir()
    --player:drawHealth()

end

function love.keypressed(key)

    weaponUi:navigate(key)

    if key == "escape" then
        love.event.quit(0)
    end

    if key == "return" then
        weaponUi:toggle()
    end

    if key == 'z' then
        player:attack()
    end

    --[[if key == 'space' then
        player:interact()
        player:useItem()
    end]]

end

function loadMap(mapName)
    gameMap = sti("maps/" .. mapName .. ".lua")
end
