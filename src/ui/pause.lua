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

function pause:createItem(n, s, sc, hx, hy)
    local item = {
        name = n,
        sprite = s,
        scale = sc,
        homeX = hx,
        homeY = hy,
        tween = nil,
        hoverScale = 1,
        growing = false
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

    pause.items = {}

    local cx = love.graphics.getWidth()/2
    local cy = love.graphics.getHeight()/2
    local box = 32*pause.scale
    local topY = cy

    pause:createItem("sword", sprites.sword, 1.35, cx - box, topY)
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

    if windowWidth < windowHeight then
        -- assumes main scale of 8
        pause.scale = 9
        pause.leftX = love.graphics.getWidth()/2 - (39 * scale)
    
        pause.y = 76 * pause.scale
        pause.trueY = 64 * pause.scale
        pause.fadeY = 76 * pause.scale
        pause.equipBoxGap = 10
    end

    pause:updateEquipped()
end

function pause:updateEquipped()
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
    if key == 'left' then
        data.item.left = pause.items[pause.hoverIndex].name
    elseif key == 'right' then
        data.item.right = pause.items[pause.hoverIndex].name
    end
    pause:updateEquipped()
end

function pause:getItemNumber()
    if pause.gridY == 1 then return 0 end
    return pause.gridX + 1
end

function pause:update(dt)
    if pause.active == false then return end

    d2 = pause.hoverIndex

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
            love.graphics.draw(panelSpr, b.homeX, self.y + b.homeY, nil, pause.scale*b.hoverScale, nil, panelSpr:getWidth()/2, panelSpr:getHeight()/2)
            love.graphics.draw(b.sprite, b.homeX, self.y + b.homeY, nil, pause.scale*b.scale*b.hoverScale, nil, b.sprite:getWidth()/2, b.sprite:getHeight()/2)
        end

        if pause.equipLeftIndex > -1 then
            local item = pause.items[pause.equipLeftIndex]
            love.graphics.draw(panelSpr, pause.equipLeftX, self.y + pause.equipLeftY, nil, pause.scale * pause.equipScale, nil, panelSpr:getWidth()/2, panelSpr:getHeight()/2)
            love.graphics.draw(item.sprite, pause.equipLeftX, self.y + pause.equipLeftY, nil, pause.scale*item.scale*pause.equipScale, nil, item.sprite:getWidth()/2, item.sprite:getHeight()/2)
        end

        if pause.equipRightIndex > -1 then
            local item = pause.items[pause.equipRightIndex]
            love.graphics.draw(panelSpr, pause.equipRightX, self.y + pause.equipRightY, nil, pause.scale * pause.equipScale, nil, panelSpr:getWidth()/2, panelSpr:getHeight()/2)
            love.graphics.draw(item.sprite, pause.equipRightX, self.y + pause.equipRightY, nil, pause.scale*item.scale*pause.equipScale, nil, item.sprite:getWidth()/2, item.sprite:getHeight()/2)
        end
    end
end
