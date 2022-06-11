function updateAll(dt)

    if pause.active == false then
        updateGame(dt)
    end
    
    pause:update(dt)
    flux.update(dt)
    dj.cleanup()
    if gameMap then gameMap:update(dt) end

end

function updateGame(dt)
    player:update(dt)
    world:update(dt)
    walls:update(dt)
    effects:update(dt)
    arrows:update(dt)
    bombs:update(dt)
    boomerang:update(dt)
    hookshot:update(dt)
    loots:update(dt)
    enemies:update(dt)
    enemies:destroyDead()

    cam:update(dt)
    shake:update(dt)
    shaders:update(dt)
    triggers:update(dt)
    particles:update(dt)
    particleWorld:update(dt)
end
