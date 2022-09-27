projectiles = {}

function spawnProjectile(type, x, y)
    local projectile = {}
    local rad = 5

    if type == "mage" then
        dj.play(sounds.enemies.projectile, "static", "effect")
        rad = 4
    end
    
    projectile = world:newCircleCollider(x, y, rad)
    projectile.type = type
    projectile.speed = 100
    projectile.dir = getSelfToPlayerVector(x, y)
    projectile.timer = 0

    if type == "mage" then
        function projectile:update(dt)
            self.timer = self.timer - dt
            if self.timer < 0 then
                self.timer = 0.02
                effects:spawn("darkMagicSpec", self:getX(), self:getY())
            end
        end

        function projectile:draw()
            --love.graphics.setColor(0,0,0,1)
            --love.graphics.circle('fill', self:getX(), self:getY(), 4)
        end
    end

    projectile.dir = projectile.dir * projectile.speed
    projectile:setLinearVelocity(projectile.dir:unpack())
    projectile:setCollisionClass("Projectile")
    projectile:setFixedRotation(true)

    table.insert(projectiles, projectile)
end

function projectiles:update(dt)
    for _,p in ipairs(projectiles) do
        if p.anim then
            p.anim:update(dt)
        end
        if p.update then
            p:update(dt)
            if p:enter('Wall') then
                p.dead = true
            end
        end
    end

    local i = #projectiles
    while i > 0 do
        if projectiles[i].dead then
            projectiles[i]:destroy()
            table.remove(projectiles, i)
        end
        i = i - 1
    end
end

function projectiles:draw()
    for _,p in ipairs(projectiles) do
        if p.draw then
            p:draw()
        end
    end
end
