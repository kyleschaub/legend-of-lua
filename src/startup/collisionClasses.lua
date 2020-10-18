function createCollisionClasses()

    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {'Ignore'}})

end