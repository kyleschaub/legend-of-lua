function createCollisionClasses()
    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {'Ignore'}})
    world:addCollisionClass('Wall', {ignores = {'Ignore'}})
end