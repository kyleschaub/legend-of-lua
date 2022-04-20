chests = {}

function spawnChest(x, y, id, size)
    local chest = {}
    chest.state = 0
    chest.x = x
    chest.y = y
    chest.id = id
    chest.size = "small"
    chest.state = 0
    if size then chest.size = size end

    -- if the id is in this list, chest has been opened
    if data.chests[id] then
        chest.state = 1
    end

    if chest.size == "small" then
        chest.width = 16
        chest.height = 15
    elseif chest.size == "big" then
        chest.width = 20
        chest.height = 15
    end

    -- Wall spawned overtop of the chest, passed chest as parent
    spawnWall(chest.x, chest.y, chest.width, chest.height, nil, chest)

    if chest.size == "small" then
        chest.x = chest.x + 1
        chest.y = chest.y - 3
    elseif chest.size == "big" then
        chest.y = chest.y - 2
    end

    function chest:interact()
        if self.state == 0 then
            self.state = 1
            -- spawn stuff
        end
    end
    
    table.insert(chests, chest)
end

function chests:update(dt)

end

function chests:draw()
    for _,c in ipairs(chests) do
        if c.state == 0 and c.size == "small" then
            love.graphics.draw(sprites.items.chestClosed, c.x, c.y)
        elseif c.state == 1 and c.size == "small" then
            love.graphics.draw(sprites.items.chestOpen, c.x, c.y)
        elseif c.state == 0 and c.size == "big" then
            love.graphics.draw(sprites.items.chestBigClosed, c.x, c.y)
        elseif c.state == 1 and c.size == "big" then
            love.graphics.draw(sprites.items.chestBigOpen, c.x, c.y)
        end
    end
end
