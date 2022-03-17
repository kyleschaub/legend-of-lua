loots = {}

function spawnLoot(x, y, type)
    local loot = {}
    loot.x = x
    loot.y = y
    loot.type = type
    loot.rot = 0
    loot.dead = false

    if loot.type == "arrow" then
        loot.spr = sprites.items.arrow
        loot.rot = math.pi/-2
    elseif loot.type == "bomb" then
        loot.spr = sprites.items.bomb
    end

    function loot:update(dt)
        if distanceBetween(self.x, self.y, player:getX(), player:getY()) < 10 and self.dead == false then
            self.dead = true
            if self.type == "arrow" then
                data.arrowCount = data.arrowCount + 1
            elseif self.type == "bomb" then
                data.bombCount = data.bombCount + 1
            end
        end
    end

    function loot:draw()
        setWhite()
        love.graphics.draw(sprites.items.lootShadow, self.x, self.y+4.5, nil, nil, nil, sprites.items.lootShadow:getWidth()/2, sprites.items.lootShadow:getHeight()/2)
        local offY = 0
        if self.type == "arrow" then offY = -2 end
        love.graphics.draw(self.spr, self.x, self.y + offY, self.rot, nil, nil, self.spr:getWidth()/2, self.spr:getHeight()/2)
    end

    table.insert(loots, loot)
end

function loots:update(dt)
    for _,l in ipairs(loots) do
        l:update(dt)
    end

    local i = #loots
    while i > 0 do
        if loots[i].dead then
            table.remove(loots, i)
        end
        i = i - 1
    end
end

function loots:draw()
    for _,l in ipairs(loots) do
        l:draw()
    end
end
