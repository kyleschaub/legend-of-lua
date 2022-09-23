pause = {}

pause.active = false
pause.scale = scale
pause.alpha = 0
pause.width = 130 * pause.scale
pause.x = love.graphics.getWidth()/2 - (pause.width/2)
pause.y = 40 * pause.scale

pause.trueY = 0 * pause.scale
pause.fadeY = 40 * pause.scale

pause.textTitle = ""
pause.textSubtitle = ""

pause.leftX = love.graphics.getWidth()/2 - (56 * scale)
pause.equipBoxGap = 6

pause.items = {}
pause.scales = {}

for i,b in ipairs(pause.items) do
    pause.scales[i] = 1
end

function pause:createItem(n, s, sc, hx, hy, r)
    local item = {
        name = n,
        sprite = s,
        scale = sc,
        x = hx,
        y = hy,
        homeX = hx,
        homeY = hy,
        rot = r or 0,
        tween = nil,
        hoverScale = 1,
        growing = false,
        visible = true
    }
    table.insert(pause.items, item)
end

function pause:init()
    pause.active = false
    pause.scale = scale
    pause.alpha = 0
    pause.width = 130 * pause.scale
    pause.x = love.graphics.getWidth()/2 - (pause.width/2)
    pause.y = 40 * pause.scale

    pause.trueY = 0 * pause.scale
    pause.fadeY = 40 * pause.scale

    pause.textTitle = ""
    pause.textSubtitle = ""

    pause.leftX = love.graphics.getWidth()/2 - (56 * scale)
    pause.equipBoxGap = 6

    if windowWidth < windowHeight then
        -- assumes main scale of 8
        pause.scale = scale * 0.8
    end

    pause.items = {}

    local cx = love.graphics.getWidth()/2
    local cy = love.graphics.getHeight()/2
    local box = 32*pause.scale
    local topY = cy

    pause:createItem("sword", sprites.sword, 1.35, cx - box, topY, math.pi/-4)
    pause:createItem("bow", sprites.items.bowIcon, 0.25, cx, topY)
    pause:createItem("boomerang", sprites.items.boomerang, 1.5, cx + box, topY)
    pause:createItem("bomb", sprites.items.bomb, 1.4, cx - box, topY + box)
    pause:createItem("grapple", sprites.items.hookshot, 1.35, cx, topY + box)
    pause:createItem("fire", sprites.items.lantern, 1.4, cx + box, topY + box)

    pause.homeX = cx
    pause.homeY = cy - box*1.2
    pause.homeLeftX = cx - box*1.1
    pause.homeRightX = cx + box*1.1
    pause.equipScale = 1.2
    pause.hoverIndex = -1

    pause.equipLeftX = pause.homeLeftX
    pause.equipLeftY = pause.homeY
    pause.equipRightX = pause.homeRightX
    pause.equipRightY = pause.homeY
    pause.equipLeftIndex = 1 -- index from the pause.items table that is equipped
    pause.equipRightIndex = 2

    pause:updateEquipped()
end

function pause:updateEquipped()
    pause.equipLeftIndex = -1
    pause.equipRightIndex = -1
    for i,b in ipairs(pause.items) do
        if b.name == data.item.left then
            pause.equipLeftIndex = i
        elseif b.name == data.item.right then
            pause.equipRightIndex = i
        end
        pause.items[i].hoverScale = 1
        pause.items[i].tween = nil
    end
end

function pause:open()
    pause:init()
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
    if pause.hoverIndex == -1 then return end
    local tweenTime = 0.2
    if key == 'left' then
        pause:unequip(key)
        pause.items[pause.hoverIndex].visible = false
        data.item.left = pause.items[pause.hoverIndex].name
        pause.equipLeftX = pause.items[pause.hoverIndex].homeX
        pause.equipLeftY = pause.items[pause.hoverIndex].homeY
        flux.to(pause, tweenTime, {equipLeftX = pause.homeLeftX}):ease("quadout")
        flux.to(pause, tweenTime, {equipLeftY = pause.homeY}):ease("quadout")
    elseif key == 'right' then
        pause:unequip(key)
        pause.items[pause.hoverIndex].visible = false
        data.item.right = pause.items[pause.hoverIndex].name
        pause.equipRightX = pause.items[pause.hoverIndex].homeX
        pause.equipRightY = pause.items[pause.hoverIndex].homeY
        flux.to(pause, tweenTime, {equipRightX = pause.homeRightX}):ease("quadout")
        flux.to(pause, tweenTime, {equipRightY = pause.homeY}):ease("quadout")
    end
    
    pause:updateEquipped()

end

function pause:unequip(key)
    local index = -1
    local tweenTime = 0.2
    local itemName = data.item[key]
    index = pause:getIndexFromName(itemName)
    data.item[key] = ""

    if key == "left" then
        pause.items[index].x = pause.homeLeftX
        pause.items[index].y = pause.homeY
    elseif key == "right" then
        pause.items[index].x = pause.homeRightX
        pause.items[index].y = pause.homeY
    end

    pause.items[index].visible = true

    local destX = pause.items[index].homeX
    local destY = pause.items[index].homeY
    flux.to(pause.items[index], tweenTime, {x = destX}):ease("quadout")
    flux.to(pause.items[index], tweenTime, {y = destY}):ease("quadout")
end

function pause:getIndexFromName(name)
    for i,b in ipairs(pause.items) do
        if b.name == name then
            return i
        end
        pause.items[i].hoverScale = 1
        pause.items[i].tween = nil
    end
end

function pause:getItemNumber()
    if pause.gridY == 1 then return 0 end
    return pause.gridX + 1
end

function pause:update(dt)
    if pause.active == false then return end

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
            --pause.textSubtitle = "Place on the ground to destroy obstacles"
            pause.textSubtitle = "Use to destroy obstacles"
        elseif pause.gridX == 3 then
            pause.textTitle = "Bow and Arrows"
            pause.textSubtitle = "Shoot at enemies to deal damage"
        end
    end

    if pause.gridY == 1 then
        if pause.gridX == 0 then
            pause.textTitle = "Lantern"
            pause.textSubtitle = "Improves visibility in dark areas"
        elseif pause.gridX == 1 then
            pause.textTitle = "Quiver"
            pause.textSubtitle = "Increases maximum arrows"
        end
    end

    local mx, my = love.mouse.getPosition()
    pause.hoverIndex = -1
    for i,b in ipairs(pause.items) do
        if pause.equipLeftIndex == i or pause.equipRightIndex == i then
            -- item is already equipped, do not tween
        elseif distanceBetween(b.homeX, b.homeY, mx, my) < 15*pause.scale then
            pause.hoverIndex = i
            if b.growing then
                -- item is already growing
            else
                if b.tween ~= nil then
                    pause.items[i].tween:stop()
                    pause.items[i].tween = nil
                end
                pause.items[i].growing = true
                pause.items[i].tween = flux.to(pause.items[i], 0.1, {hoverScale = 1.2}):ease("quadout")
            end
        else
            pause.items[i].growing = false
            if b.tween then pause.items[i].tween:stop() pause.items[i].tween = nil end
            if b.hoverScale ~= 1 then
                pause.items[i].tween = flux.to(pause.items[i], 0.1, {hoverScale = 1}):ease("quadout")
            end
        end
    end
end

function pause:draw()
    if self.active then
        love.graphics.setColor(0,0,0,0.7 * pause.alpha)
        love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)

        love.graphics.setColor(1,1,1,pause.alpha)

        love.graphics.draw(sprites.pause.itemPanelL, pause.homeLeftX, self.y + pause.homeY, nil, pause.scale * pause.equipScale, nil, sprites.pause.itemPanelL:getWidth()/2, sprites.pause.itemPanelL:getHeight()/2)
        love.graphics.draw(sprites.pause.mouse, pause.homeX, self.y + pause.homeY, nil, pause.scale, nil, sprites.pause.mouse:getWidth()/2, sprites.pause.mouse:getHeight()/2)
        love.graphics.draw(sprites.pause.itemPanelR, pause.homeRightX, self.y + pause.homeY, nil, pause.scale * pause.equipScale, nil, sprites.pause.itemPanelL:getWidth()/2, sprites.pause.itemPanelL:getHeight()/2)

        local panelSpr = sprites.pause.itemPanel

        for _,b in ipairs(pause.items) do
            if b.visible then
                love.graphics.draw(panelSpr, b.x, self.y + b.y, nil, pause.scale*b.hoverScale, nil, panelSpr:getWidth()/2, panelSpr:getHeight()/2)
                love.graphics.draw(b.sprite, b.x, self.y + b.y, b.rot, pause.scale*b.scale*b.hoverScale, nil, b.sprite:getWidth()/2, b.sprite:getHeight()/2)
            end
        end

        if pause.equipLeftIndex > -1 then
            local item = pause.items[pause.equipLeftIndex]
            love.graphics.draw(panelSpr, pause.equipLeftX, self.y + pause.equipLeftY, nil, pause.scale * pause.equipScale, nil, panelSpr:getWidth()/2, panelSpr:getHeight()/2)
            love.graphics.draw(item.sprite, pause.equipLeftX, self.y + pause.equipLeftY, item.rot, pause.scale*item.scale*pause.equipScale, nil, item.sprite:getWidth()/2, item.sprite:getHeight()/2)
        end

        if pause.equipRightIndex > -1 then
            local item = pause.items[pause.equipRightIndex]
            love.graphics.draw(panelSpr, pause.equipRightX, self.y + pause.equipRightY, nil, pause.scale * pause.equipScale, nil, panelSpr:getWidth()/2, panelSpr:getHeight()/2)
            love.graphics.draw(item.sprite, pause.equipRightX, self.y + pause.equipRightY, item.rot, pause.scale*item.scale*pause.equipScale, nil, item.sprite:getWidth()/2, item.sprite:getHeight()/2)
        end
    end
end
