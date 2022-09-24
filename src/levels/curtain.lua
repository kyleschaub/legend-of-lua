curtain = {}

-- 0 = inactive
-- 1 = closing
-- 2 = opening
curtain.state = 0
curtain.alpha = 0
curtain.rad = 0
curtain.type = "circle"
curtain.x = -10
curtain.y = -10
curtain.dirTime = 0.5

-- Transition information
curtain.destMap = "test"
curtain.destX = 0
curtain.destY = 0

function curtain:call(destMap, destX, destY, type)
    curtain.destMap = destMap
    curtain.destX = destX
    curtain.destY = destY
    curtain.type = "circle"
    if type then curtain.type = type end
    player.state = 12
    curtain.x = -10
    curtain.y = -10
    curtain.width = love.graphics.getWidth() + 20
    curtain.height = love.graphics.getHeight() + 20
    curtain:close()
end

function curtain:getRad()
    if love.graphics.getWidth() > love.graphics.getHeight() then
        return love.graphics.getWidth()*0.65
    else
        return love.graphics.getHeight()*0.65
    end
end

function curtain:draw()
    if curtain.state == 0 then return end

    local bVal = 16

    if curtain.type == "fade" then
        love.graphics.setColor(bVal/255,bVal/255,bVal/255, curtain.alpha)
        love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)
    elseif curtain.type == "left" or curtain.type == "right" or curtain.type == "up" or curtain.type == "down" then
        love.graphics.setColor(bVal/255,bVal/255,bVal/255,1)
        love.graphics.rectangle("fill", curtain.x, curtain.y, curtain.width, curtain.height)
    else -- circle
        love.graphics.setColor(bVal/255,bVal/255,bVal/255,1)
        love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, self.rad)
    end
end

function curtain:close()
    self.state = 1

    if curtain.type == "fade" then
        flux.to(self, 0.4, {alpha = 1}):ease("linear"):oncomplete(function() self:open() end)
    elseif curtain.type == "left" then
        curtain.x = -1 * curtain.width - 10
        curtain.y = -10
        flux.to(self, curtain.dirTime, {x = -10}):ease("quadout"):oncomplete(function() self:open() end)
    elseif curtain.type == "right" then
        curtain.x = curtain.width + 10
        curtain.y = -10
        flux.to(self, curtain.dirTime, {x = -10}):ease("quadout"):oncomplete(function() self:open() end)
    elseif curtain.type == "down" then
        curtain.x = -10
        curtain.y = curtain.height + 10
        flux.to(self, curtain.dirTime, {y = -10}):ease("quadout"):oncomplete(function() self:open() end)
    elseif curtain.type == "up" then
        curtain.x = -10
        curtain.y = -1 * curtain.height - 10
        flux.to(self, curtain.dirTime, {y = -10}):ease("quadout"):oncomplete(function() self:open() end)
    else -- circle
        local destRad = self.getRad()
        flux.to(self, 1, {rad = destRad}):ease("quadout"):oncomplete(function() self:open() end)
    end
end

function curtain:open()
    self.state = 2
    cam.smoother = Camera.smooth.none()
    triggerTransition(self.destMap, self.destX, self.destY)
    love.graphics.setBackgroundColor(96/255, 174/255, 140/255)

    local onFinish = function()
        self.state = 0
        player.state = 0
        cam.smoother = Camera.smooth.damped(8)
    end

    if curtain.type == "fade" then
        flux.to(self, 0.4, {alpha = 0}):ease("linear"):oncomplete(onFinish)
    elseif curtain.type == "left" then
        curtain.x = -10
        curtain.y = -10
        local dest = curtain.width + 10
        flux.to(self, curtain.dirTime, {x = dest}):ease("quadin"):oncomplete(onFinish)
    elseif curtain.type == "right" then
        curtain.x = -10
        curtain.y = -10
        local dest = -1 * curtain.width - 10
        flux.to(self, curtain.dirTime, {x = dest}):ease("quadin"):oncomplete(onFinish)
    elseif curtain.type == "down" then
        curtain.x = -10
        curtain.y = -10
        local dest = -1 * curtain.height - 10
        flux.to(self, curtain.dirTime, {y = dest}):ease("quadin"):oncomplete(onFinish)
    elseif curtain.type == "up" then
        curtain.x = -10
        curtain.y = -10
        local dest = curtain.height + 10
        flux.to(self, curtain.dirTime, {y = dest}):ease("quadin"):oncomplete(onFinish)
    else -- circle
        flux.to(self, 1, {rad = 0}):ease("quadin"):oncomplete(onFinish)
    end
end
