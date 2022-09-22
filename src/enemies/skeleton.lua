local function skeletonInit(enemy, x, y, args)
    enemy.physics = world:newBSGRectangleCollider(x, y, 12, 16, 3)
    enemy.physics:setCollisionClass('Enemy')
    enemy.physics:setFixedRotation(true)
    enemy.physics:setMass(1)
    enemy.physics:setLinearDamping(2)
    enemy.physics.parent = enemy

    enemy.form = 1
    enemy.sprite = sprites.enemies.skeletonKnife

    if args and args.form ~= nil then
        enemy.form = args.form
    end

    enemy.health = 3
    enemy.magnitude = 40
    enemy.dir = vector(0, 1)
    enemy.viewDistance = 100

    if enemy.form == 2 then -- Mage
        enemy.sprite = sprites.enemies.skeletonMage
        enemy.chase = false
        enemy.projTimer = 0

        function enemy:aggro(dt)
            self.projTimer = self.projTimer - dt
            if self.projTimer < 0 then
                if self.state == 100 then
                    self.state = 101
                    self.projTimer = 1.2
                    enemy.anim = enemy.animations.walk
                elseif self.state == 101 then
                    self.state = 100
                    self.projTimer = 0.4
                    enemy.anim = enemy.animations.staff
                    spawnProjectile('mage', self.physics:getX(), self.physics:getY())
                end
            end

            if self.state == 101 then
                self.dir = getSelfToPlayerVector(self.physics:getX(), self.physics:getY())*10 -- speed
                self.physics:setX(self.physics:getX() + self.dir.x * dt)
                self.physics:setY(self.physics:getY() + self.dir.y * dt)
            end
        end
    end

    enemy.grid = anim8.newGrid(20, 24, enemy.sprite:getWidth(), enemy.sprite:getHeight())

    enemy.animations = {}
    enemy.animations.walk = anim8.newAnimation(enemy.grid('1-2', 1), 0.4)

    if enemy.form == 2 then
        enemy.animations.staff = anim8.newAnimation(enemy.grid(3, 1), 1)
    end

    enemy.anim = enemy.animations.walk

    enemy.scaleX = 1
    if math.random() < 0.5 then enemy.scaleX = -1 end

    -- Used to control the walk animation
    -- 0: standing still
    -- 1: walking
    -- 2: running
    enemy.moving = 0

    function enemy:update(dt)
        enemy:moveLogic(dt, true) -- Stiff movement
        local px, py = player:getPosition()
        local ex, ey = self.physics:getPosition()
        
        self:setScaleX()

        if self.state == 1 or self.state == 99 then
            self.moving = 0
            if self.anim then self.anim:gotoFrame(1) end
        elseif self.state == 1.1 then
            self.moving = 1
        else
            if self.form == 2 then
                self.moving = 1
            else
                self.moving = 2
            end
        end

    end

    function enemy:draw()
        setWhite()
        local ex, ey = self.physics:getPosition()
        local shadow = sprites.enemies.shadowMed
        local shadowOff = -0.75 * self.scaleX
        love.graphics.draw(shadow, ex + shadowOff, ey+9, nil, nil, nil, shadow:getWidth()/2, shadow:getHeight()/2)
        if self.flashTimer > 0 then
            love.graphics.setColor(223/255,106/255,106/255,1)
        end
        if self.dizzyTimer == 0 then
            self.anim:draw(self.sprite, ex, ey, nil, self.scaleX, 1, 10, 12)
        else
            love.graphics.draw(sprites.enemies.skeletonDead, ex - (3*self.scaleX), ey-4, nil, self.scaleX, 1, 8, 8)
        end
        setWhite()
        if self.state == 99 then
            love.graphics.draw(sprites.enemies.alert, ex, ey-14.5, nil, nil, nil, sprites.enemies.alert:getWidth()/2, sprites.enemies.alert:getHeight()/2)
        end
    end

    function enemy:die()
        local ex, ey = self.physics:getPosition()
        local args = {}
        args.scaleX = self.scaleX
        args.form = self.form
        effects:spawn("batDeath", ex, ey+3, args)
    end

    return enemy

end

return skeletonInit