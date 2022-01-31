boomerang = {}
boomerang.x = 0
boomerang.y = 0
boomerang.sprite = sprites.items.boomerang
boomerang.rot = 0
boomerang.dir = vector(0, 0)
boomerang.speed = 140
boomerang.timer = 0

-- 0 = inactive
-- 1 = flying away
-- 2 = returning to player
boomerang.state = 0

function boomerang:update(dt)
    if self.state == 0 then return end

    self.rot = self.rot + 20*dt
    
    if self.timer > 0 then
        self.timer = self.timer - dt
    end

    if self.timer < 0 then
        self.timer = 0
        self.state = 2
    end

    if self.state == 2 then
        self.dir = vector(player:getX() - self.x, player:getY() - self.y):normalized() * self.speed
        if distanceBetween(player:getX(), player:getY(), self.x, self.y) < 10 then
            self.state = 0
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
    self.x = player:getX()
    self.y = player:getY()
    self.state = 1
    self.timer = 0.65
    self.dir = getDirectionVector(dir) * self.speed
end
