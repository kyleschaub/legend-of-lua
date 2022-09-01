function particleEvent(type, x, y, arg)

    if type == "rockBreak" then
        spawnParticle("debris", x, y, 1)
        spawnParticle("debris", x, y, 2)
        spawnParticle("debris", x, y, 3)
        spawnParticle("debris", x, y, 4)
    end

    if type == "death" then
        --spawnParticle("death", x, y, {dir = vector(-1, 1)})
        --spawnParticle("death", x, y, {dir = vector(-1, -1)})
        --spawnParticle("death", x, y, {dir = vector(1, 1)})
        --spawnParticle("death", x, y, {dir = vector(1, -1)})

        --[[for i=1,14 do
            local angle = 0 - (i/14 * math.pi)
            local newDir = vector(1, 0):rotated(angle)
            effects:spawn("damage", x, y, {dir = newDir})
        end]]

        --[[for i=1,40 do
            local angle = 0 - (i/41 * math.pi)
            local newDir = vector(1, 0):rotated(angle)
            spawnParticle("death", x, y, {dir = newDir})
        end]]

        spawnBlast(x, y, 20, "white", 0.2)
        for i=1,20 do
            local angle = math.pi/-6 - (i/21 * math.pi/1.5)
            local newDir = vector(1, 0):rotated(angle)
            spawnParticle("death", x, y, {dir = newDir})
        end
        shake:start(0.1, 1, 0.02)
    end

    if type == "playerHit" then
        --spawnBlast(x, y, 20, "white", 0.2)
        for i=1,14 do
            local angle = math.pi/-6 - (i/21 * math.pi/1.5)
            local newDir = vector(1, 0):rotated(angle)
            spawnParticle("death", x, y, {dir = newDir, scl = 0.6})
        end
    end

end