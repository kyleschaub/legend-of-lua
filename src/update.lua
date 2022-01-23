function updateAll(dt)

    player:update(dt)
    world:update(dt)
    walls:update(dt)
    effects:update(dt)
    bombs:update(dt)

    cam:update(dt)

    flux.update(dt)
    dj.cleanup()

end
