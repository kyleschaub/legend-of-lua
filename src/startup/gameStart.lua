function gameStart()

    -- Currently assumes 1080p resolution
    love.window.setFullscreen(true)

    Camera = require "libraries/hump/camera"
    cam = Camera(1300, 800, 1)

    vector = require "libraries/hump/vector"

    anim8 = require("libraries/anim8/anim8")
    sti = require("libraries/Simple-Tiled-Implementation/sti")

    local windfield = require("libraries/windfield/windfield")
    world = windfield.newWorld()
    world:setQueryDebugDrawing(true)

    require("src/startup/collisionClasses")
    createCollisionClasses()

    -- Load assets and resources
    require("src/startup/resources")
    require("src/player")
    require("src/weapons/sword")
    require("src/global")

end