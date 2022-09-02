boomerang = {}
boomerang.x = 0
boomerang.y = 0
boomerang.sprite = sprites.items.boomerang
boomerang.rot = 0
boomerang.dir = vector(0, 0)
boomerang.speed = 250
boomerang.baseSpeed = 250
boomerang.timer = 0
boomerang.accel = 340
boomerang.rad = 6

-- 0 = inactive
-- 1 = flying away
-- 2 = returning to player
boomerang.state = 0

function boomerang:update(dt)
    if self.state == 0 then return end

    self.rot = self.rot + 20*dt
    
    if self.state == 1 then
        self.speed = self.speed - self.accel*dt
        self.dir = self.dir:normalized() * self.speed
        if self.speed < 0 then
            self.speed = 1
            self.state = 2
        end

        -- Query for walls
        local walls = world:queryCircleArea(self.x, self.y, self.rad, {'Wall'})
        if #walls > 0 then
            self.state = 2
        end

        local hitEnemies = world:queryCircleArea(self.x, self.y, self.rad, {'Enemy'})
        for _,e in ipairs(hitEnemies) do
            e.parent:hit(0, self.dir, 0.1, 2)
            particleEvent("playerHit", e.parent.physics:getX(), e.parent.physics:getY())
        end
        if #hitEnemies > 0 then self.state = 2 end
    elseif self.state == 2 then
        self.dir = vector(player:getX() - self.x, player:getY() - self.y):normalized() * self.speed
        self.speed = self.speed + self.accel*dt
        if distanceBetween(player:getX(), player:getY(), self.x, self.y) < 10 then
            self.state = 0
            self.speed = self.baseSpeed
        end
    end

    for _,l in ipairs(loots) do
        if distanceBetween(l.x, l.y, self.x, self.y) < 10 then
            l.boomeranged = true
        end
    end

    self.x = self.x + self.dir.x * dt
    self.y = self.y + self.dir.y * dt
end

function boomerang:draw()
    -- don't draw anything if the boomerang is not active
    if self.state == 0 then return end
    love.graphics.draw(self.sprite, self.x, self.y, self.rot, nil, nil, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
end

function boomerang:throw(dir)
    if self.state > 0 then return end
    self.x = player:getX()
    self.y = player:getY()
    self.state = 1
    self.timer = 0.65
    self.dir = toMouseVector(self.x, self.y) * self.speed

    player:useSet()
end
