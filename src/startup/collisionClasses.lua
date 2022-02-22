function createCollisionClasses()
    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {'Ignore'}})
    world:addCollisionClass('Wall', {ignores = {'Ignore'}})
    world:addCollisionClass('Enemy', {ignores = {'Ignore'}})

    particleWorld:addCollisionClass('Particle', {ignores = {'Particle'}})
end