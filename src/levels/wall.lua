walls = {}

function spawnWall(x, y, width, height, name)

    -- name is used to identify special types of walls (ex. breakable walls)
    -- also used to identify walls that might not need to be spawned
    -- for example, once a breakable wall is destroyed, do not spawn it later
    if data.breakables[name] then return end

    local wall = world:newRectangleCollider(x, y, width, height, {collision_class = "Wall"})
    wall:setType('static')
    wall.dead = false
    wall.offY = 0
    wall.name = name

    if name and name:startswith('break') then
        wall.breakable = true

        -- an example of a name is 'breakRock1', where Rock tells us the sprite
        if name:find("Rock") then
            wall.sprite = sprites.environment.breakableRock
            function wall:onBreak()
                data.breakables[self.name] = true
                particleEvent("rockBreak", x+width/2, y+height/2)
            end
        elseif name:find("Wall") then
            wall.sprite = sprites.environment.breakableWall
            wall.offY = -8
            function wall:onBreak()
                data.breakables[self.name] = true
                particleEvent("rockBreak", x+width/2, y+height/2)
            end
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
            love.graphics.draw(w.sprite, w:getX(), w:getY() + w.offY, nil, nil, nil, w.sprite:getWidth()/2, w.sprite:getHeight()/2)
        end
    end
end
