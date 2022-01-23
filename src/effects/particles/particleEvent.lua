function particleEvent(type, x, y, arg)

    if type == "rockBreak" then
        spawnParticle("debris", x, y, 1)
        spawnParticle("debris", x, y, 2)
        spawnParticle("debris", x, y, 3)
        spawnParticle("debris", x, y, 4)
    end

end