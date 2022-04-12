curtain = {}

-- 0 = inactive
-- 1 = closing
-- 2 = opening
curtain.state = 0
curtain.alpha = 0

function curtain:call()
    curtain:close()
end

function curtain:draw()
    if curtain.state == 0 then return end

    love.graphics.setColor(0,0,0, curtain.alpha)
    love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)
end

function curtain:close()
    self.state = 1
    flux.to(self, 1, {alpha = 1}):ease("quadout"):oncomplete(function() self:open() end)
end

function curtain:open()
    self.state = 2
    flux.to(self, 1, {alpha = 0}):ease("quadout"):oncomplete(function() self.state = 0 end)
end
