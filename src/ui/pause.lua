pause = {}
pause.active = false
pause.scale = scale
pause.alpha = 0
pause.width = 130 * pause.scale
pause.x = love.graphics.getWidth()/2 - (pause.width/2)
pause.y = 28 * pause.scale

function pause:open()
    self.active = true
end

function pause:close()
    self.active = false
end

function pause:toggle()
    if self.active then
        pause:close()
    else
        pause:open()
    end
end

function pause:update(dt)

end

function pause:draw()
    if self.active then
        love.graphics.setColor(0,0,0,0.7)
        love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)

        -- Draw all boxes
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(sprites.hud.equipBox, love.graphics.getWidth()/2 - (self.width/6), self.y, nil, pause.scale, nil, sprites.hud.equipBox:getWidth()/2, sprites.hud.equipBox:getHeight()/2)
        love.graphics.draw(sprites.hud.equipBox, love.graphics.getWidth()/2 + (self.width/6), self.y, nil, pause.scale, nil, sprites.hud.equipBox:getWidth()/2, sprites.hud.equipBox:getHeight()/2)
        love.graphics.draw(sprites.hud.wideBox, love.graphics.getWidth()/2, self.y + (33 * pause.scale), nil, pause.scale, nil, sprites.hud.wideBox:getWidth()/2, sprites.hud.wideBox:getHeight()/2)
        love.graphics.draw(sprites.hud.wideBox, love.graphics.getWidth()/2, self.y + (63 * pause.scale), nil, pause.scale, nil, sprites.hud.wideBox:getWidth()/2, sprites.hud.wideBox:getHeight()/2)

        -- Draw all items
        love.graphics.draw(sprites.sword, love.graphics.getWidth()/2 - (56 * scale), self.y + (33 * pause.scale), math.pi/-2, pause.scale*1.35, nil, sprites.sword:getWidth()/2, sprites.sword:getHeight()/2)
        love.graphics.draw(sprites.items.boomerang, love.graphics.getWidth()/2 - (34 * scale), self.y + (33 * pause.scale), nil, pause.scale*1.8, nil, sprites.items.boomerang:getWidth()/2, sprites.items.boomerang:getHeight()/2)
        love.graphics.draw(sprites.items.bomb, love.graphics.getWidth()/2 - (12 * scale), self.y + (34 * pause.scale), nil, pause.scale*1.5, nil, sprites.items.bomb:getWidth()/2, sprites.items.bomb:getHeight()/2)
        love.graphics.draw(sprites.items.bowIcon, love.graphics.getWidth()/2 - (-10 * scale), self.y + (33 * pause.scale), nil, pause.scale*0.25, nil, sprites.items.bowIcon:getWidth()/2, sprites.items.bowIcon:getHeight()/2)

        love.graphics.draw(sprites.items.lantern, love.graphics.getWidth()/2 - (56 * scale), self.y + (63 * pause.scale), nil, pause.scale*1.5, nil, sprites.items.lantern:getWidth()/2, sprites.items.lantern:getHeight()/2)

        -- Draw the Z and X box labels
        love.graphics.setFont(fonts.pauseZX)
        love.graphics.printf("Z", love.graphics.getWidth()/2 - (self.width/6 + 200), self.y - (28*scale), 400, "center")
        love.graphics.printf("X", love.graphics.getWidth()/2 + (self.width/6 - 200), self.y - (28*scale), 400, "center")

        -- Text at the bottom
        love.graphics.setFont(fonts.pause1)
        love.graphics.printf("Sword", love.graphics.getWidth()/2 - 4000, self.y + (80 * pause.scale), 8000, "center")
        love.graphics.setFont(fonts.pause2)
        love.graphics.printf("Slash at enemies to deal damage", love.graphics.getWidth()/2 - 4000, self.y + (92 * pause.scale), 8000, "center")

        --love.graphics.rectangle("line", self.x, self.y, self.width, 24 * pause.scale)
    end
end
