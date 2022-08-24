function updateAll(dt)

    if pause.active == false then
        updateGame(dt)
    end
    
    pause:update(dt)
    dj.cleanup()
    if gameMap then gameMap:update(dt) end

end

function updateGame(dt)
    miscUpdate(dt)
    if globalStun > 0 then return end

    flux.update(dt)

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
    projectiles:update(dt)

    cam:update(dt)
    shake:update(dt)
    shaders:update(dt)
    triggers:update(dt)
    particles:update(dt)
    particleWorld:update(dt)
end
