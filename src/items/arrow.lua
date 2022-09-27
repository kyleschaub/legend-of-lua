arrows = {}

function spawnArrow(x, y)
    if data.arrowCount < 1 then
        return
    end
    
    --data.arrowCount = data.arrowCount - 1
    local direction = toMouseVector(x, y)

    local arrow = {}
    arrow.x = x
    arrow.y = y
    arrow.timer = 4
    arrow.dead = false
    arrow.dir = direction
    arrow.dirVec = direction
    arrow.rot = math.atan2(direction.y, direction.x)
    arrow.rad = 3
    arrow.speed = 230

    function arrow:update(dt)
        self.timer = self.timer - dt
        if self.timer < 0 then
            self.dead = true
        end

        --effects:spawn("arrowTrail", self.x, self.y, self.dir)

        self.x = self.x + (self.dirVec.x * self.speed * dt)
        self.y = self.y + (self.dirVec.y * self.speed * dt)

        -- Query for walls
        local walls = world:queryCircleArea(self.x, self.y, self.rad, {'Wall'})
        if #walls > 0 then self.dead = true end

        -- Query for enemies
        local hitEnemies = world:queryCircleArea(self.x, self.y, self.rad, {'Enemy'})
        for _,e in ipairs(hitEnemies) do
            e.parent:hit(1, self.dirVec, 0.1)
        end
        if #hitEnemies > 0 then self.dead = true end

    end

    dj.play(sounds.items.arrow, "static", "effect")

    table.insert(arrows, arrow)
end

function arrows:update(dt)
    for _,b in ipairs(arrows) do
        b:update(dt)
    end

    local i = #arrows
    while i > 0 do
        if arrows[i].dead then
            table.remove(arrows, i)
        end
        i = i - 1
    end
end

function arrows:draw(layer)
    for _,a in ipairs(arrows) do
        if (layer == -1 and a.y < player:getY() or (layer == 1 and a.y >= player:getY())) then
            love.graphics.draw(sprites.items.arrow, a.x, a.y, a.rot, nil, nil, sprites.items.arrow:getWidth()/2, sprites.items.arrow:getHeight()/2)
        end
    end
end
