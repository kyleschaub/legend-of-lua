function drawBeforeCamera()
    menu:draw()
end

function drawCamera()

    if gamestate == 0 then return end
    setWhite()

    if gameMap.layers["Background"] then
        gameMap:drawLayer(gameMap.layers["Background"])
    end

    if gameMap.layers["Base"] then
        gameMap:drawLayer(gameMap.layers["Base"])
    end
  
    if gameMap.layers["Objects"] then
        gameMap:drawLayer(gameMap.layers["Objects"])
    end

    if gameMap.layers["Objects2"] then
        gameMap:drawLayer(gameMap.layers["Objects2"])
    end

    if gameMap.layers["Test"] then
        --gameMap:drawLayer(gameMap.layers["Test"])
    end

    effects:draw(-1) -- two layers of effects
    walls:draw()
    chests:draw()
    bombs:draw()
    boomerang:draw()
    loots:draw()
    arrows:draw(-1)
    hookshot:draw(-1)
    effects:draw(0)
    player:draw()
    arrows:draw(1)
    hookshot:draw(1)
    npcs:draw()
    enemies:draw()
    effects:drawDarkMagic()
    blasts:draw()
    projectiles:draw()
    effects:draw(1)
    particles:draw()

    if gameMap.dark then
        love.graphics.setShader(shaders.trueLight)
        love.graphics.rectangle("fill", -10, -10, 10000, 10000)
        love.graphics.setShader()
    end

end

function drawAfterCamera()
    curtain:draw()
    if gamestate == 0 then return end
    drawHUD()
    pause:draw()
end