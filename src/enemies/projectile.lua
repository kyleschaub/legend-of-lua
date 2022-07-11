projectiles = {}

function spawnProjectile(type, x, y)
    local projectile = {}
    local rad = 5
    
    projectile = world:newCircleCollider(x, y, rad)
    projectile.type = type
    projectile.speed = 100
    projectile.dir = getSelfToPlayerVector(x, y)

    if type == "mage" then

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
        end
    end

    local i = #projectiles
    while i > 0 do
        if projectiles[i].dead then
            projectiles[i].physics:destroy()
            table.remove(projectiles, i)
        end
        i = i - 1
    end
end

function projectiles:draw()

end
