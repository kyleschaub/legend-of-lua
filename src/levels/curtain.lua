curtain = {}

-- 0 = inactive
-- 1 = closing
-- 2 = opening
curtain.state = 0
curtain.alpha = 0
curtain.rad = 0

function curtain:call()
    curtain:close()
end

function curtain:getRad()
    if love.graphics.getWidth() > love.graphics.getHeight() then
        return love.graphics.getWidth()*0.75
    else
        return love.graphics.getHeight()*0.75
    end
end

function curtain:draw()
    if curtain.state == 0 then return end

    --love.graphics.setColor(0,0,0, curtain.alpha)
    --love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)
    love.graphics.setColor(0,0,0,1)
    love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, self.rad)
end

function curtain:close()
    self.state = 1
    local destRad = self.getRad()
    flux.to(self, 1.25, {rad = destRad}):ease("quadout"):oncomplete(function() self:open() end)
end

function curtain:open()
    self.state = 2
    flux.to(self, 1.25, {rad = 0}):ease("quadin"):oncomplete(function() self.state = 0 end)
end
