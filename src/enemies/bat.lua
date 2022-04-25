local function batInit(enemy, x, y, args)
    enemy.physics = world:newBSGRectangleCollider(x, y, 11, 9, 1)
    enemy.physics:setCollisionClass('Enemy')
    enemy.physics:setFixedRotation(true)
    enemy.physics:setMass(1)
    enemy.physics:setLinearDamping(2)
    enemy.physics.parent = enemy

    enemy.form = 1
    enemy.sprite = sprites.enemies.bat

    if args and args.form ~= nil then
        enemy.form = args.form
    end

    enemy.health = 1
    enemy.speed = 0
    enemy.maxSpeed = 80
    enemy.magnitude = 450
    enemy.dir = vector(0, 1)
    enemy.viewDistance = 100

    enemy.stunTimer = 0
    enemy.dizzyTimer = 0

    enemy.grid = anim8.newGrid(16, 16, enemy.sprite:getWidth(), enemy.sprite:getHeight())
    enemy.anim = anim8.newAnimation(enemy.grid('1-2', 1), 0.15)

    enemy.floatTime = 0.5
    enemy.floatY = 0
    enemy.floatMax = 1.5

    enemy.scaleX = 1
    if math.random() < 0.5 then enemy.scaleX = -1 end

    function enemy:floatDown(dest)
        self.tween = flux.to(self, self.floatTime, {floatY = dest}):ease("sineinout"):oncomplete(function() self:floatUp(self.floatMax) end)
    end

    function enemy:floatUp(dest, start)
        local time = self.floatTime
        if start then time = math.random() end
        self.tween = flux.to(self, time, {floatY = dest}):ease("sineinout"):oncomplete(function() self:floatDown(self.floatMax*-1) end)
    end

    function enemy:hit(damage, dir, stun, dizziness)
        self.health = self.health - damage
        self.physics:applyLinearImpulse((dir:normalized()*300):unpack())
        self.stunTimer = stun
        self.flashTimer = 0.15
        if damage == 0 then self.flashTimer = 0 end
        self.dizzyTimer = dizziness or 0
    end

    enemy:floatUp(enemy.floatMax, true)

    function enemy:update(dt)
        if self.stunTimer > 0 then
            self.stunTimer = self.stunTimer - dt
        end
        if self.stunTimer < 0 then
            self.stunTimer = 0
            self.physics:setLinearVelocity(0, 0)
        end

        if self.dizzyTimer > 0 then
            self.dizzyTimer = self.dizzyTimer - dt
        end
        if self.dizzyTimer < 0 then
            self.dizzyTimer = 0
        end

        if self.stunTimer == 0 and self.dizzyTimer == 0 then
            self.anim:update(dt)
            local px, py = player:getPosition()
            local ex, ey = self.physics:getPosition()
            if distanceBetween(px, py, ex, ey) < self.viewDistance then
                self.dir = vector(px - ex, py - ey):normalized() * self.magnitude
                if distanceBetween(0, 0, self.physics:getLinearVelocity()) < self.maxSpeed then
                    self.physics:applyForce(self.dir:unpack())
                end
                if px < ex then
                    self.scaleX = -1
                else
                    self.scaleX = 1
                end
            end

            if self.health <= 0 then
                self.dead = true
                self:die()
            end
        else

        end
    end

    function enemy:draw()
        setWhite()
        local ex, ey = self.physics:getPosition()
        love.graphics.draw(sprites.enemies.shadow, ex, ey+10, nil, nil, nil, sprites.enemies.eyeShadow:getWidth()/2, sprites.enemies.eyeShadow:getHeight()/2)
        if self.flashTimer > 0 then
            love.graphics.setColor(223/255,106/255,106/255,1)
        end
        if self.dizzyTimer == 0 then
            self.anim:draw(self.sprite, ex, ey-self.floatY, nil, self.scaleX, 1, 8, 8)
        else
            love.graphics.draw(sprites.enemies.batDead, ex, ey+3, nil, self.scaleX, 1, 8, 8)
        end
        setWhite()
    end

    function enemy:die()
        local ex, ey = self.physics:getPosition()
        local args = {}
        args.form = self.form
        effects:spawn("batDeath", ex, ey+3, args)
    end

    return enemy

end

return batInit