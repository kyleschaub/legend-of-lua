function createCollisionClasses()
    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('Ground', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {'Ignore'}})
    world:addCollisionClass('Wall', {ignores = {'Ignore'}})
    world:addCollisionClass('Transition', {ignores = {'Ignore'}})
    world:addCollisionClass('Enemy', {ignores = {'Ignore', 'Player'}})
    world:addCollisionClass('Projectile', {ignores = {'Ignore', 'Enemy', 'Player', 'Ground', 'Transition'}})

    particleWorld:addCollisionClass('Particle', {ignores = {'Particle'}})
end