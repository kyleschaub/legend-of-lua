local function deathInit(particle, x, y, args)

    particle.physics = particleWorld:newCircleCollider(x, y, 4)
    particle.physics:setFixedRotation(true)
    particle.physics:setCollisionClass("Particle")
    particle.physics.parent = particle

    particle.sprite = sprites.effects.death
    particle.timer = 3
    particle.alpha = 1
    particle.scaleX = 1

    if args.scl then particle.scaleX = args.scl end

    local mag = 80 + math.random()*80
    particle.physics:setLinearVelocity(((args.dir):normalized()*mag):unpack())

    function particle:update(dt)
        self.scaleX = self.scaleX - dt*1.5
        if self.scaleX <= 0 then
            self.alpha = 0
        end
    end

    function particle:draw()
        love.graphics.setColor(1,1,1,self.alpha)
        local px, py = self.physics:getPosition()
        love.graphics.draw(self.sprite, px, py, nil, self.scaleX, nil, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
        setWhite()
    end

    return particle

end

return deathInit