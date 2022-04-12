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
    require("src/effects/particles/particle")
    require("src/effects/particles/particleEvent")

    require("src/enemies/enemy")

    require("src/items/item")
    require("src/items/loot")
    require("src/items/arrow")
    require("src/items/bomb")
    require("src/items/boomerang")
    
    require("src/levels/loadMap")
    require("src/levels/npc")
    require("src/levels/transition")
    require("src/levels/wall")

    require("src/ui/hud")

    require("src/utilities/cam")
    require("src/utilities/destroyAll")
    require("src/utilities/shake")
    require("src/utilities/utils")

end