walls = {}

function spawnWall(x, y, width, height)

    local wall = world:newRectangleCollider(x, y, width, height, {collision_class = "Wall"})
    wall:setType('static')

    table.insert(walls, wall)

end
