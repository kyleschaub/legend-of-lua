weaponUi = {}
weaponUi.hoverIndex = 0
weaponUi.leftX = 0
weaponUi.yOffset = 100
weaponUi.y = love.graphics.getHeight()/2 + weaponUi.yOffset
weaponUi.gap = 30
weaponUi.blockWidth = sprites.ui.item_box_empty:getWidth()
weaponUi.backgroundAlpha = 0
weaponUi.boxAlpha = 0
weaponUi.tweenSpeed = 0.20

function weaponUi:draw()

    if gamestate ~= 1 then
        return
    end

    local count = #weaponStorage
    local cx = love.graphics.getWidth()/2

    -- draw background
    love.graphics.setColor(0, 0, 0, weaponUi.backgroundAlpha)
    love.graphics.rectangle("fill", -20, -20, love.graphics.getWidth() + 40, love.graphics.getHeight() + 40)

    local hoveredWeapon = nil

    love.graphics.setColor(1, 1, 1, weaponUi.boxAlpha)
    for i,w in ipairs(weaponStorage) do
        local boxSpr = sprites.ui.item_box_empty

        local selected = false
        if w.tag == player.weaponTag then
            selected = true
        end

        local hovered = false
        if weaponUi.hoverIndex == i then
            hovered = true
            hoveredWeapon = w
        end

        if selected and hovered then
            boxSpr = sprites.ui.item_box_selected_hover
        elseif selected then
            boxSpr = sprites.ui.item_box_selected
        elseif hovered then
            boxSpr = sprites.ui.item_box_empty_hover
        end

        local boxX = (cx - weaponUi.leftX) + (weaponUi.gap + weaponUi.blockWidth) * (i-1)
        love.graphics.draw(boxSpr, boxX, weaponUi.y, nil, nil, nil, boxSpr:getWidth()/2, boxSpr:getHeight()/2)
        love.graphics.draw(w.sprite, boxX, weaponUi.y, 3*math.pi/2, 1.3, 1.3, w.sprite:getWidth()/2, w.sprite:getHeight()/2)
    end

    if hoveredWeapon then
        love.graphics.setFont(fonts.weaponName)
        love.graphics.printf(hoveredWeapon.name, 0, weaponUi.y + 130, love.graphics.getWidth(), "center")
    end

end

function weaponUi:toggle()

    if player.state ~= 0 then
        return
    end

    if gamestate == 0 then
        weaponUi:open()
    elseif gamestate == 1 then
        weaponUi:close()
    end

end

function weaponUi:open()

    gamestate = 1
    weaponUi.y = love.graphics.getHeight()/2 + weaponUi.yOffset
    
    flux.to(weaponUi, weaponUi.tweenSpeed, {backgroundAlpha = 0.5}):ease("linear")
    flux.to(weaponUi, weaponUi.tweenSpeed, {boxAlpha = 1}):ease("linear")
    flux.to(weaponUi, weaponUi.tweenSpeed, {y = love.graphics.getHeight()/2}):ease("quartout")

    weaponUi:calculateLeftX()

    for i,w in ipairs(weaponStorage) do
        if w.tag == player.weaponTag then
            weaponUi.hoverIndex = i
        end
    end

end

function weaponUi:calculateLeftX()

    local count = #weaponStorage

    if count == 0 or count == 1 then
        weaponUi.leftX = 0
    elseif count % 2 == 0 then
        weaponUi.leftX = (weaponUi.gap/2 + weaponUi.blockWidth/2) + (weaponUi.gap + weaponUi.blockWidth) * (count/2 - 1)
    else
        weaponUi.leftX = math.floor(count/2) * (weaponUi.gap + weaponUi.blockWidth)
    end

end

function weaponUi:close()
    --gamestate = 0
    flux.to(weaponUi, weaponUi.tweenSpeed, {backgroundAlpha = 0}):ease("linear"):oncomplete(
        function() gamestate = 0 end
    )
    flux.to(weaponUi, weaponUi.tweenSpeed, {boxAlpha = 0}):ease("linear")
    flux.to(weaponUi, weaponUi.tweenSpeed, {y = love.graphics.getHeight()/2 + weaponUi.yOffset}):ease("linear")
end

function weaponUi:navigate(key)
    if gamestate ~= 1 then
        return
    end

    local count = #weaponStorage

    if key == "left" then
        weaponUi.hoverIndex = weaponUi.hoverIndex - 1
        if weaponUi.hoverIndex < 1 then
            weaponUi.hoverIndex = count
        end
    end

    if key == "right" then
        weaponUi.hoverIndex = weaponUi.hoverIndex + 1
        if weaponUi.hoverIndex > count then
            weaponUi.hoverIndex = 1
        end
    end

    if key == "z" or key == "space" then
        local w = weaponStorage[weaponUi.hoverIndex]
        player.weaponTag = w.tag
        player.weaponType = w.type
        player.weaponId = w.id
    end

    if key == "rshift" then
        table.remove(weaponStorage, weaponUi.hoverIndex)
        local count = #weaponStorage
        if weaponUi.hoverIndex > count then
            weaponUi.hoverIndex = count
        end
        weaponUi:calculateLeftX()
    end

end