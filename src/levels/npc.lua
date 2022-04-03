npcs = {}

function spawnNPC(name, x, y)
    local npc = {}
    npc.name = name
    npc.x = x
    npc.y = y
    npc.sprite = sprites.npc.merchant

    function npc:draw()
        love.graphics.draw(self.sprite, self.x, self.y, nil, nil, nil, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
    end

    table.insert(npcs, npc)
end

function npcs:draw()
    for _,n in ipairs(npcs) do
        n:draw()
    end
end
