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

    -- if the id is in this list, the chest was already opened
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
    spawnWall(chest.x, chest.y, chest.width, chest.height, nil, nil, chest)

    if chest.size == "small" then
        chest.x = chest.x + 1
        chest.y = chest.y - 3
        chest.centerX = chest.x + 7
        chest.centerY = chest.y + 8
    elseif chest.size == "big" then
        chest.y = chest.y - 2
        chest.centerX = chest.x + 10
        chest.centerY = chest.y + 8
    end

    function chest:interact()
        if self.state == 0 then
            self.state = 1
            data.chests[self.id] = true
            if self.size == "small" then
                chests:spawnSmallLoot(self.centerX, self.centerY, self.id)
            elseif self.size == "big" then
                player:gotItem(chests:getBigLoot(self.id), true)
            end
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

function chests:spawnSmallLoot(x, y, id)
    local function getJumpVec(dirX, dirY, speed)
        local vecSpeed = 30
        if speed then vecSpeed = speed end
        return vector(dirX, dirY):normalized() * vecSpeed
    end

    if id == 'test1' then
        spawnLoot(x, y, "heart", true, nil, getJumpVec(-1, 0))
        spawnLoot(x, y, "bomb", true, nil, getJumpVec(1, 0))
    elseif id == 'test2' then
        spawnLoot(x, y, "coin1", true, nil, getJumpVec(-1, 0))
        spawnLoot(x, y, "coin1", true, nil, getJumpVec(-1, 1))
        spawnLoot(x, y, "coin1", true, nil, getJumpVec(1, 1))
        spawnLoot(x, y, "coin1", true, nil, getJumpVec(1, 0))
    elseif id == 'test3' then
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(-1, 0))
        spawnLoot(x, y, "coin3", true, nil, getJumpVec(-1, 1))
        spawnLoot(x, y, "coin3", true, nil, getJumpVec(1, 1))
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(1, 0))
    end
end

function chests:getBigLoot(id)
    if id == 'test2' then
        return sprites.items.boomerang
    end
end
