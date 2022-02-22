local function eyeInit(enemy, x, y, args)

    enemy.physics = world:newBSGRectangleCollider(x, y, 12, 16, 3)
    enemy.physics:setCollisionClass('Enemy')
    enemy.physics:setFixedRotation(true)
    enemy.physics:setMass(1)
    enemy.physics:setLinearDamping(1)
    enemy.physics.parent = enemy

    enemy.grid = anim8.newGrid(20, 20, sprites.enemies.eye:getWidth(), sprites.enemies.eye:getHeight())
    enemy.anim = anim8.newAnimation(enemy.grid('1-2', 1), 0.3)

    enemy.health = 2
    enemy.speed = 0
    enemy.maxSpeed = 120
    enemy.magnitude = 150
    enemy.dir = vector(0, 1)
    enemy.viewDistance = 100

    function enemy:update(dt)
        self.anim:update(dt)

        local ex, ey = self.physics:getPosition()

        --[[local colliders = {}
        if self.horizontal then
            colliders = world:queryRectangleArea(ex + (46 * self.flyDir), ey, 3, 6, {'Platform', 'Danger'})
        else
            colliders = world:queryRectangleArea(ex - 3, ey + (35 * self.flyDir), 3, 6, {'Platform', 'Danger'})
        end

        if #colliders > 0 then
            self.flyDir = self.flyDir * -1
        end]]

        --[[if enemy.floating then
            self.physics:setY(self.floatY)
        end]]

        local px, py = player:getPosition()
        local ex, ey = self.physics:getPosition()
        if distanceBetween(px, py, ex, ey) < self.viewDistance then
            self.dir = vector(px - ex, py - ey):normalized() * self.magnitude
            if distanceBetween(0, 0, self.physics:getLinearVelocity()) < self.maxSpeed then
                self.physics:applyForce(self.dir:unpack())
            end
        end
    end

    function enemy:draw()
        setWhite()
        local ex, ey = self.physics:getPosition()
        love.graphics.draw(sprites.enemies.eyeShadow, ex, ey+10, nil, nil, nil, sprites.enemies.eyeShadow:getWidth()/2, sprites.enemies.eyeShadow:getHeight()/2)
        self.anim:draw(sprites.enemies.eye, ex, ey, nil, nil, nil, 10, 10)
    end

    function enemy:die()
        local ex, ey = self.physics:getPosition()
        effects:spawn("eyeDeath", ex, ey+3)
    end

    return enemy

end

return eyeInit