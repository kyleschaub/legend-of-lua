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
    enemy.magnitude = 55
    enemy.dir = vector(0, 1)
    enemy.viewDistance = 100

    enemy.grid = anim8.newGrid(20, 24, enemy.sprite:getWidth(), enemy.sprite:getHeight())
    enemy.anim = anim8.newAnimation(enemy.grid('1-2', 1), 0.4)
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
        if px < ex then
            self.scaleX = -1
        else
            self.scaleX = 1
        end

        if self.state == 1 then
            self.moving = 0
        elseif self.state == 1.1 then
            self.moving = 1
        else
            self.moving = 2
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
            love.graphics.draw(sprites.enemies.batDead, ex, ey+3, nil, self.scaleX, 1, 8, 8)
        end
        setWhite()
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