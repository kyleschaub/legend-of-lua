bombs = {}

function spawnBomb()
    if data.bombCount < 1 then
        --return
    end
    
    --data.bombCount = data.bombCount - 1

    local bomb = {}
    bomb.x = player:getX()
    bomb.y = player:getY()
    bomb.state = 0 -- 0 is just placed, 1 is flashing
    bomb.timer = 2
    bomb.smokeTimer = 0.03
    bomb.dead = false
    bomb.explosionRadius = 16

    bomb.grid = anim8.newGrid(12, 12, sprites.items.bombSheet:getWidth(), sprites.items.bombSheet:getHeight())
    bomb.anim1 = anim8.newAnimation(bomb.grid(1, 1), 1)
    bomb.anim2 = anim8.newAnimation(bomb.grid('1-2', 1), 0.13)
    bomb.anim = bomb.anim1

    player:useSet()
    dj.play(sounds.items.set, "static", "effect")

    local offVec = toMouseVector(bomb.x, bomb.y)*14
    bomb.x = bomb.x + offVec.x
    bomb.y = bomb.y + offVec.y

    function bomb:explode()
        effects:spawn("explosion", self.x, self.y)
        effects:spawn("scorch", self.x, self.y)
        shake:start(0.1, 1.5, 0.03)
        self.dead = true

        -- Query for breakable walls
        local walls = world:queryCircleArea(self.x, self.y, self.explosionRadius, {'Wall'})
        for _,w in ipairs(walls) do
            if w.breakable then
                w.dead = true
            end
        end

        local hitEnemies = world:queryCircleArea(self.x, self.y, self.explosionRadius, {'Enemy'})
        for _,e in ipairs(hitEnemies) do
            local dir = getFromToVector(self.x, self.y, e:getX(), e:getY())
            e.parent:hit(3, dir, 0.2)
        end

        local hitPlayer = world:queryCircleArea(self.x, self.y, self.explosionRadius, {'Player'})
        if #hitPlayer > 0 then
            player:hurt(1, self.x, self.y)
        end

        for _,b in ipairs(bombs) do
            if distanceBetween(self.x, self.y, b.x, b.y) < (self.explosionRadius + 12) then
                b.state = 1
                b.timer = 0.1
            end
        end        
    end

    function bomb:update(dt)
        self.timer = self.timer - dt
        if self.timer < 0 then
            if self.state == 0 then
                self.timer = 1
                self.anim = self.anim2 -- start flashing
                self.state = 1
            elseif self.state == 1 then
                self:explode()
            end
        end
        self.smokeTimer = self.smokeTimer - dt
        if self.smokeTimer < 0 then
            effects:spawn("fuseSmoke", self.x, self.y-6.5)
            self.smokeTimer = 0.05
        end
        self.anim:update(dt)
    end

    table.insert(bombs, bomb)
end

function bombs:update(dt)
    for _,b in ipairs(bombs) do
        b:update(dt)
    end

    local i = #bombs
    while i > 0 do
        if bombs[i].dead then
            table.remove(bombs, i)
        end
        i = i - 1
    end
end

function bombs:draw()
    for _,b in ipairs(bombs) do
        b.anim:draw(sprites.items.bombSheet, b.x, b.y, nil, nil, nil, 6, 6)
        --love.graphics.draw(sprites.items.bomb, b.x, b.y, nil, nil, nil, 6, 6)
    end
end
