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

    enemy.grid = anim8.newGrid(16, 16, enemy.sprite:getWidth(), enemy.sprite:getHeight())
    enemy.anim = anim8.newAnimation(enemy.grid('1-2', 1), 0.15)

    enemy.floatTime = 0.5
    enemy.floatY = 0
    enemy.floatMax = 1.5

    enemy.scaleX = 1
    if math.random() < 0.5 then enemy.scaleX = -1 end

    enemy:floatUp(enemy.floatMax, true)

    function enemy:update(dt)
        enemy:moveLogic(dt)
        local px, py = player:getPosition()
        local ex, ey = self.physics:getPosition()
        self:setScaleX()
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

return batInit