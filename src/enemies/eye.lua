local function eyeInit(enemy, x, y, args)
    enemy.physics = world:newBSGRectangleCollider(x, y, 12, 16, 3)
    enemy.physics:setCollisionClass('Enemy')
    enemy.physics:setFixedRotation(true)
    enemy.physics:setMass(1)
    enemy.physics:setLinearDamping(2)
    enemy.physics.parent = enemy

    enemy.grid = anim8.newGrid(20, 20, sprites.enemies.eye:getWidth(), sprites.enemies.eye:getHeight())
    enemy.anim = anim8.newAnimation(enemy.grid('1-2', 1), 0.3)

    enemy.health = 3
    enemy.speed = 0
    enemy.maxSpeed = 100
    enemy.magnitude = 400
    enemy.dir = vector(0, 1)
    enemy.viewDistance = 100

    enemy.stunTimer = 0

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
            love.graphics.setColor(0.75,0,0,1)
        end
        self.anim:draw(sprites.enemies.eye, ex, ey, nil, nil, nil, 10, 10)
        setWhite()
    end

    function enemy:die()
        local ex, ey = self.physics:getPosition()
        effects:spawn("eyeDeath", ex, ey+3)
    end

    return enemy

end

return eyeInit