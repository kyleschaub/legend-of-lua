function gameStart()

    math.randomseed(os.time())
    love.graphics.setBackgroundColor(26/255, 26/255, 26/255)

    -- Initialize all global variables for the game
    initGlobals()

    -- Make pixels scale!
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- 3 parameters: fullscreen, width, height
    -- width and height are ignored if fullscreen is true
    setWindowSize(false, 1920, 1080)

    -- The game's graphics scale up, this method finds the right ratio
    setScale()

    vector = require "libraries/hump/vector"
    flux = require "libraries/flux/flux"
    require "libraries/tesound"
    require("libraries/show")

    anim8 = require("libraries/anim8/anim8")
    sti = require("libraries/Simple-Tiled-Implementation/sti")

    local windfield = require("libraries/windfield")
    world = windfield.newWorld(0, 0, false)
    world:setQueryDebugDrawing(true)

    -- This second world is for particles, and has downward gravity
    particleWorld = windfield.newWorld(0, 250, false)
    particleWorld:setQueryDebugDrawing(true)

    require("src/startup/require")
    requireAll()

end

function setWindowSize(full, width, height)
    if full then
        love.window.setFullscreen(true)
        windowWidth = love.graphics.getWidth()
        windowHeight = love.graphics.getHeight()
    else
        if width == nil or height == nil then
            windowWidth = 1920
            windowHeight = 1080
        else
            windowWidth = width
            windowHeight = height
        end
        love.window.setMode( windowWidth, windowHeight, flags )
    end
end

function initGlobals()
    data = {} -- save data, will be loaded after game begins

    -- game state
    -- 0: main menu
    -- 1: gameplay
    gamestate = 0
    globalStun = 0
end

function setScale(input)
    scale = (8 / 1200) * windowHeight

    if input == "zone" then -- 12 tiles high
        scale = (6.25 / 1200) * windowHeight
    end

    if cam then
        cam:zoomTo(scale)
    end
end
