Camera = require "libraries/hump/camera"
cam = Camera(0, 0, scale)
cam.smoother = Camera.smooth.damped(8)

function cam:update(dt)

    local camX, camY = player:getPosition()

    -- This section prevents the camera from viewing outside the background
    -- First, get width/height of the game window, divided by the game scale
    local w = love.graphics.getWidth() / scale
    local h = love.graphics.getHeight() / scale

    -- Get width/height of background
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    -- Left border
    if camX < w/2 then
        camX = w/2
    end

    -- Right border
    if camY < h/2 then
        camY = h/2
    end

    -- Right border
    if camX > (mapW - w/2) then
        camX = (mapW - w/2)
    end
    -- Bottom border
    if camY > (mapH - h/2) then
        camY = (mapH - h/2)
    end

    cam:lockPosition(camX, camY)
  
    -- cam.x and cam.y keep track of where the camera is located
    -- the lookAt value may be moved if a screenshake is happening, so these
    -- values know where the camera should be, regardless of lookAt
    cam.x, cam.y = cam:position()
    
end
