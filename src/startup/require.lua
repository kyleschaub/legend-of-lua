function requireAll()

    require("src/startup/collisionClasses")
    createCollisionClasses()

    -- Load assets, resources, data
    require("src/startup/resources")
    require("src/startup/data")
    
    require("src/utilities/cam")
    require("src/utilities/destroyAll")
    require("src/utilities/misc")
    require("src/utilities/shaders")
    require("src/utilities/shake")
    require("src/utilities/triggers")
    require("src/utilities/utils")

    require("src/player2")
    require("src/update")
    require("src/draw")

    require("src/effects/effect")
    require("src/effects/particles/particle")
    require("src/effects/particles/particleEvent")

    require("src/enemies/projectile")
    require("src/enemies/enemy")

    require("src/items/item")
    require("src/items/loot")
    require("src/items/arrow")
    require("src/items/bomb")
    require("src/items/boomerang")
    require("src/items/hookshot")
    require("src/items/chest")
    
    require("src/levels/curtain")
    require("src/levels/loadMap")
    require("src/levels/npc")
    require("src/levels/transition")
    require("src/levels/wall")

    require("src/ui/hud")
    require("src/ui/menu")
    require("src/ui/pause")

end