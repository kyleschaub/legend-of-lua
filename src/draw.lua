function drawBeforeCamera()

end

function drawCamera()

    setWhite()

    if gameMap.layers["Base"] then
        gameMap:drawLayer(gameMap.layers["Base"])
    end
  
    if gameMap.layers["Objects"] then
        gameMap:drawLayer(gameMap.layers["Objects"])
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
    player:draw()
    arrows:draw(1)
    npcs:draw()
    enemies:draw()
    effects:draw(1)
    particles:draw()

    if gameMap.dark then
        love.graphics.setShader(shaders.trueLight)
        --love.graphics.setColor(0,0,0,1)
        love.graphics.rectangle("fill", -10, -10, 10000, 10000)
        love.graphics.setShader()
    end

end

function drawAfterCamera()
    curtain:draw()
    drawHUD()
end