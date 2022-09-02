waters = {}

function spawnWater(x, y, width, height)
    local water = {}
    water.x = x
    water.y = y
    water.width = width
    water.height = height
    water.timer = math.random(0, 2) + math.random()

    local effectiveW = width-16
    local effectiveY = height-16
    local effectiveArea = effectiveW * effectiveY
    local max = 400/effectiveArea
    water.maxTime = max

    -- Wall spawned overtop of the water, passed water as parent
    spawnWall(water.x, water.y, water.width, water.height, nil, 'ground', water)

    function water:update(dt)
        self.timer = self.timer - dt
        if self.timer < 0 then
            self.timer = self.maxTime + math.random()
            local ex = math.random(0, self.width-16)
            local ey = math.random(0, self.height-16)
            effects:spawn("wave", self.x + 8 + ex, self.y + 8 + ey)
        end
    end
    
    table.insert(waters, water)
end

function waters:update(dt)
    for _,w in ipairs(waters) do
        w:update(dt)
    end
end
