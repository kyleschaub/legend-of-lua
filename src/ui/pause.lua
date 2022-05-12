pause = {}
pause.active = false
pause.scale = scale
pause.alpha = 0
pause.width = 130 * pause.scale
pause.x = love.graphics.getWidth()/2 - (pause.width/2)
pause.y = 40 * pause.scale

pause.trueY = 28 * pause.scale
pause.fadeY = 40 * pause.scale

pause.cursor = {}
pause.gridX = 0
pause.gridY = 0
pause.cursor.grid = anim8.newGrid(24, 24, sprites.pause.cursor:getWidth(), sprites.pause.cursor:getHeight(), nil, nil, 1)
pause.cursor.anim = anim8.newAnimation(pause.cursor.grid('1-2', 1), 0.35)

pause.textTitle = ""
pause.textSubtitle = ""
pause.spriteZ = nil
pause.spriteX = nil
pause.spriteZrot = 0
pause.spriteXrot = 0
pause.spriteZscale = 1
pause.spriteXscale = 1
pause.spriteZoffY = 0
pause.spriteXoffY = 0

function pause:open()
    self.active = true
    flux.to(pause, 0.25, {alpha = 1}):ease("quadout")
    flux.to(pause, 0.25, {y = pause.trueY}):ease("quadout")
end

function pause:close()
    --self.active = false
    flux.to(pause, 0.25, {alpha = 0}):ease("quadout"):oncomplete(function() pause.active = false end)
    flux.to(pause, 0.25, {y = pause.fadeY}):ease("quadout")
end

function pause:toggle()
    if self.active then
        pause:close()
    else
        pause:open()
    end
end

function pause:equip(key)
    if key == 'z' then
        data.item.z = pause:getItemNumber()
    elseif key == 'x' then
        data.item.x = pause:getItemNumber()
    end
end

function pause:getItemNumber()
    if pause.gridY == 1 then return 0 end
    return pause.gridX + 1
end

function pause:getSprite(key)
    local item = data.item[key]
    local spr = nil
    local rot = 0
    local sprScale = 1
    local offY = 0
    
    if item == 1 then
        spr = sprites.sword
        rot = math.pi/-2
        sprScale = 1.35
    elseif item == 2 then
        spr = sprites.items.boomerang
        sprScale = 1.8
    elseif item == 3 then
        spr = sprites.items.bomb
        sprScale = 1.5
        offY = 1
    elseif item == 4 then
        spr = sprites.items.bowIcon
        sprScale = 0.25
    end

    if key == 'z' then
        pause.spriteZ = spr
        pause.spriteZrot = rot
        pause.spriteZscale = sprScale
        pause.spriteZoffY = offY
    elseif key == 'x' then
        pause.spriteX = spr
        pause.spriteXrot = rot
        pause.spriteXscale = sprScale
        pause.spriteXoffY = offY
    end
end

function pause:update(dt)
    pause.cursor.anim:update(dt)

    pause.textTitle = ""
    pause.textSubtitle = ""
    pause.spriteZ = nil
    pause.spriteX = nil

    if pause.gridY == 0 then
        if pause.gridX == 0 then
            pause.textTitle = "Sword"
            pause.textSubtitle = "Slash at enemies to deal damage"
        elseif pause.gridX == 1 then
            pause.textTitle = "Boomerang"
            pause.textSubtitle = "Throw at enemies to stun them"
        elseif pause.gridX == 2 then
            pause.textTitle = "Bombs"
            pause.textSubtitle = "Place on the ground to destroy obstacles"
        elseif pause.gridX == 3 then
            pause.textTitle = "Bow and Arrows"
            pause.textSubtitle = "Shoot arrows at enemies to deal damage"
        end
    end

    if pause.gridY == 1 then
        if pause.gridX == 0 then
            pause.textTitle = "Lantern"
            pause.textSubtitle = "Improves visibility in dark areas"
        elseif pause.gridX == 1 then
            pause.textTitle = "Quiver"
            pause.textSubtitle = "Increases the maximum number of arrows you can carry"
        end
    end

    pause:getSprite('z')
    pause:getSprite('x')
end

function pause:draw()
    if self.active then
        love.graphics.setColor(0,0,0,0.7 * pause.alpha)
        love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)

        -- Draw all boxes
        love.graphics.setColor(1,1,1,pause.alpha)
        love.graphics.draw(sprites.pause.equipBox, love.graphics.getWidth()/2 - (self.width/6), self.y, nil, pause.scale, nil, sprites.pause.equipBox:getWidth()/2, sprites.pause.equipBox:getHeight()/2)
        love.graphics.draw(sprites.pause.equipBox, love.graphics.getWidth()/2 + (self.width/6), self.y, nil, pause.scale, nil, sprites.pause.equipBox:getWidth()/2, sprites.pause.equipBox:getHeight()/2)
        love.graphics.draw(sprites.pause.wideBox, love.graphics.getWidth()/2, self.y + (33 * pause.scale), nil, pause.scale, nil, sprites.pause.wideBox:getWidth()/2, sprites.pause.wideBox:getHeight()/2)
        love.graphics.draw(sprites.pause.wideBox, love.graphics.getWidth()/2, self.y + (63 * pause.scale), nil, pause.scale, nil, sprites.pause.wideBox:getWidth()/2, sprites.pause.wideBox:getHeight()/2)

        -- Draw equipped items
        if pause.spriteZ then
            love.graphics.draw(pause.spriteZ, love.graphics.getWidth()/2 - (self.width/6), self.y + (pause.spriteZoffY * pause.scale), pause.spriteZrot, pause.scale * pause.spriteZscale, nil, pause.spriteZ:getWidth()/2, pause.spriteZ:getHeight()/2)
        end
        if pause.spriteX then
            love.graphics.draw(pause.spriteX, love.graphics.getWidth()/2 + (self.width/6), self.y + (pause.spriteXoffY * pause.scale), pause.spriteXrot, pause.scale * pause.spriteXscale, nil, pause.spriteX:getWidth()/2, pause.spriteX:getHeight()/2)
        end

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
        love.graphics.printf(pause.textTitle, love.graphics.getWidth()/2 - 4000, self.y + (80 * pause.scale), 8000, "center")
        love.graphics.setFont(fonts.pause2)
        love.graphics.printf(pause.textSubtitle, love.graphics.getWidth()/2 - 4000, self.y + (92 * pause.scale), 8000, "center")

        -- Cursor
        local cx = (love.graphics.getWidth()/2 - (56 * scale)) + (22 * pause.gridX * scale)
        local cy = (self.y + (33 * pause.scale)) + (30 * pause.gridY * scale)
        pause.cursor.anim:draw(sprites.pause.cursor, cx, cy, nil, pause.scale*0.95, nil, 12, 12)

        --love.graphics.rectangle("line", self.x, self.y, self.width, 24 * pause.scale)
    end
end
