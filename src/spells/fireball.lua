fireballs = {}

function spawnFire(x, y)
    local direction = toMouseVector(x, y)

    local fireball = {}
    fireball.x = x
    fireball.y = y
    fireball.timer = 4
    fireball.emberTimer = 0.1
    fireball.dead = false
    fireball.dir = direction
    fireball.dirVec = direction
    fireball.rot = math.atan2(direction.y, direction.x)
    fireball.rad = 3
    fireball.speed = 160

    function fireball:update(dt)
        self.timer = self.timer - dt
        if self.timer < 0 then
            self.dead = true
        end

        self.emberTimer = self.emberTimer - dt
        if self.emberTimer < 0 then
            local emberScale = 0.85
            effects:spawn("fireballSmoke", self.x, self.y, {scale = 0.8})
            effects:spawn("ember", self.x, self.y, {scale = emberScale})
            effects:spawn("ember", self.x, self.y, {scale = emberScale})
            effects:spawn("ember", self.x, self.y, {scale = emberScale})
            effects:spawn("ember", self.x, self.y, {scale = emberScale})
            self.emberTimer = 0.005
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

    table.insert(fireballs, fireball)
end

function fireballs:update(dt)
    for _,b in ipairs(fireballs) do
        b:update(dt)
    end

    local i = #fireballs
    while i > 0 do
        if fireballs[i].dead then
            table.remove(fireballs, i)
        end
        i = i - 1
    end
end

function fireballs:draw(layer)
    for _,a in ipairs(fireballs) do
        if (layer == -1 and a.y < player:getY() or (layer == 1 and a.y >= player:getY())) then
            love.graphics.draw(sprites.effects.fireball, a.x, a.y, a.rot, 0.8, nil, sprites.effects.fireball:getWidth()/2, sprites.effects.fireball:getHeight()/2)
        end
    end
end
