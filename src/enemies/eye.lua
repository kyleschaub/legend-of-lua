local function eyeInit(enemy, x, y, args)
    enemy.physics = world:newBSGRectangleCollider(x, y, 12, 16, 3)
    enemy.physics:setCollisionClass('Enemy')
    enemy.physics:setFixedRotation(true)
    enemy.physics:setMass(1)
    enemy.physics:setLinearDamping(2)
    enemy.physics.parent = enemy

    enemy.form = 1
    enemy.sprite = sprites.enemies.eye1
    if args and args.form ~= nil then
        enemy.form = args.form
    end

    enemy.health = 2
    enemy.speed = 0
    enemy.maxSpeed = 60
    enemy.magnitude = 400
    enemy.dir = vector(0, 1)
    enemy.viewDistance = 1.00

    if enemy.form == 2 then
        enemy.health = 3
        enemy.maxSpeed = 80
        enemy.magnitude = 450
        enemy.sprite = sprites.enemies.eye2
    elseif enemy.form == 3 then
        enemy.health = 4
        enemy.maxSpeed = 100
        enemy.magnitude = 500
        enemy.sprite = sprites.enemies.eye3
    end

    enemy.stunTimer = 0

    enemy.grid = anim8.newGrid(20, 20, enemy.sprite:getWidth(), enemy.sprite:getHeight())
    enemy.anim = anim8.newAnimation(enemy.grid('1-2', 1), 0.3)

    enemy.floatTime = 0.7
    enemy.floatY = 0
    enemy.floatMax = 1.5

    function enemy:floatDown(dest)
        self.tween = flux.to(self, self.floatTime, {floatY = dest}):ease("sineinout"):oncomplete(function() self:floatUp(self.floatMax) end)
    end

    function enemy:floatUp(dest, start)
        local time = self.floatTime
        if start then time = math.random() end
        self.tween = flux.to(self, time, {floatY = dest}):ease("sineinout"):oncomplete(function() self:floatDown(self.floatMax*-1) end)
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

        if self.stunTimer == 0 then
            self.anim:update(dt)
            local px, py = player:getPosition()
            local ex, ey = self.physics:getPosition()
            if distanceBetween(px, py, ex, ey) < self.viewDistance then
                self.dir = vector(px - ex, py - ey):normalized() * self.magnitude
                if distanceBetween(0, 0, self.physics:getLinearVelocity()) < self.maxSpeed then
                    self.physics:applyForce(self.dir:unpack())
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
        love.graphics.draw(sprites.enemies.eyeShadow, ex, ey+10, nil, nil, nil, sprites.enemies.eyeShadow:getWidth()/2, sprites.enemies.eyeShadow:getHeight()/2)
        if self.flashTimer > 0 then
            love.graphics.setColor(223/255,106/255,106/255,1)
        end
        self.anim:draw(self.sprite, ex, ey-self.floatY, nil, nil, nil, 10, 10)
        setWhite()
    end

    function enemy:die()
        local ex, ey = self.physics:getPosition()
        local args = {}
        args.form = self.form
        effects:spawn("eyeDeath", ex, ey+3, args)
    end

    return enemy

end

return eyeInit