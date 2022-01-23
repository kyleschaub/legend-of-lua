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

    walls:draw()
    bombs:draw()
    player:draw()
    effects:draw()
    particles:draw()

end

function drawAfterCamera()
    --drawHUD()
end