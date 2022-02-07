function updateAll(dt)

    player:update(dt)
    world:update(dt)
    walls:update(dt)
    effects:update(dt)
    bombs:update(dt)
    boomerang:update(dt)

    cam:update(dt)
    shake:update(dt)

    particles:update(dt)
    particleWorld:update(dt)

    flux.update(dt)
    dj.cleanup()

end
