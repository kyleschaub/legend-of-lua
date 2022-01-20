function requireAll()

    require("src/startup/collisionClasses")
    createCollisionClasses()

    -- Load assets, resources, data
    require("src/startup/resources")
    require("src/startup/data")

    require("src/player")
    require("src/update")
    require("src/draw")

    require("src/effects/effect")

    require("src/items/bomb")

    require("src/levels/loadMap")
    require("src/levels/wall")

    require("src/ui/hud")

    require("src/utilities/cam")
    require("src/utilities/utils")

end