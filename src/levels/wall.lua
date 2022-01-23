walls = {}

function spawnWall(x, y, width, height, name)

    -- name is used to identify special types of walls (ex. breakable walls)
    -- also used to identify walls that might not need to be spawned
    -- for example, once a breakable wall is destroyed, do not spawn it later

    local wall = world:newRectangleCollider(x, y, width, height, {collision_class = "Wall"})
    wall:setType('static')
    wall.dead = false

    if name and name:startswith('break') then
        wall.breakable = true

        -- an example of a name is 'breakRock1', where Rock tells us the sprite
        if name:find("Rock") then
            wall.sprite = sprites.sword
        end

        function wall:onBreak()
            -- Spawn appropriate particles
        end
    end

    table.insert(walls, wall)

end

function walls:update(dt)
    local i = #walls
    while i > 0 do
        if walls[i].dead then
            walls[i]:onBreak()
            walls[i]:destroy()
            table.remove(walls, i)
        end
        i = i - 1
    end
end

function walls:draw()
    -- most walls are invisible colliders, but some have sprites
    for _,w in ipairs(walls) do
        if w.sprite then
            love.graphics.draw(w.sprite, w:getX(), w:getY())
        end
    end
end
