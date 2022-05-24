curtain = {}

-- 0 = inactive
-- 1 = closing
-- 2 = opening
curtain.state = 0
curtain.alpha = 0
curtain.rad = 0
curtain.type = "circle"

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

    if curtain.type == "fade" then
        love.graphics.setColor(0,0,0, curtain.alpha)
        love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)
    else -- circle
        love.graphics.setColor(0,0,0,1)
        love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, self.rad)
    end
end

function curtain:close()
    self.state = 1

    if curtain.type == "fade" then
        flux.to(self, 0.4, {alpha = 1}):ease("linear"):oncomplete(function() self:open() end)
    else -- circle
        local destRad = self.getRad()
        flux.to(self, 1, {rad = destRad}):ease("quadout"):oncomplete(function() self:open() end)
    end
end

function curtain:open()
    self.state = 2
    triggerTransition(self.destMap, self.destX, self.destY)

    if curtain.type == "fade" then
        flux.to(self, 0.4, {alpha = 0}):ease("linear"):oncomplete(function() self.state = 0 player.state = 0 end)
    else -- circle
        flux.to(self, 1, {rad = 0}):ease("quadin"):oncomplete(function() self.state = 0 player.state = 0 end)
    end
end
