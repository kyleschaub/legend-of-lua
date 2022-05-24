function drawHUD()
    --drawHearts()
    --drawItemBox()
    --drawMoney()
end

function drawHearts()
    for i = 0, data.maxHealth-1 do
        local heartSpr = sprites.hud.emptyHeart
        if player.health - i == 0.5 then
            heartSpr = sprites.hud.halfHeart
        elseif player.health > i then
            heartSpr = sprites.hud.heart
        end
        love.graphics.draw(heartSpr, 6 + (i * 15*scale), 6, nil, scale)
    end
end

function drawMoney()
    local mx = love.graphics.getWidth() - 23*scale
    local my = love.graphics.getHeight() - 10*scale
    local tx = love.graphics.getWidth() - 12*scale
    local ty = love.graphics.getHeight() - 11*scale
    setWhite()
    love.graphics.draw(sprites.hud.coin, mx, my, nil, 1.5*scale)
    love.graphics.setFont(fonts.coins)
    love.graphics.print(data.money, tx, ty)
end

function drawItemBox()
    -- Below the hearts
    --local bx = 6
    --local by = 16*scale

    -- Upper-right
    local bx = love.graphics.getWidth() - 19*scale
    local by = 6

    love.graphics.setColor(0,0,0, 0.35)
    love.graphics.rectangle("fill", bx+1, by+1, 16*scale, 16*scale)
    setWhite()
    love.graphics.draw(sprites.hud.itemBox, bx, by, nil, scale)

    local ammoCount = -1
    local maxed = false
    if data.item.x == 2 then
        ammoCount = data.bombCount
        if data.bombCount == data.maxBombCount then
            maxed = true
        end
    elseif data.item.x == 3 then
        ammoCount = data.arrowCount
        if data.arrowCount == data.maxArrowCount then
            maxed = true
        end
    end
    
    if ammoCount > -1 then
        love.graphics.setColor(0,0,0, 0.35)
        love.graphics.rectangle("fill", bx+(3*scale), by+(20*scale), 11*scale, 7*scale)
        setWhite()
        love.graphics.draw(sprites.hud.ammoBox, bx+(2.5*scale), by+(19*scale), nil, scale)

        love.graphics.setFont(fonts.ammo)
        if maxed then love.graphics.setColor(0,1,0,1) end
        love.graphics.printf(ammoCount, bx+(4.5*scale), by+(20*scale), 9.5*scale, "center")
        --love.graphics.print(ammoCount, bx+(3*scale), by+(20*scale))
        setWhite()
    end

    local spr = sprites.items.boomerang
    local offX = -1.5
    local offY = -1.5
    local scaleMod = 1.25
    if data.item.x == 1 then -- boomerang
        spr = sprites.items.boomerang
    elseif data.item.x == 2 then -- bomb
        spr = sprites.items.bomb
        offX = 2.3
        offY = 2.8
        scaleMod = 1.1
    elseif data.item.x == 3 then -- bow
        spr = sprites.items.bowIcon
        offX = 4.2
        offY = 2.3
        scaleMod = 0.17
    end
    love.graphics.draw(spr, bx + (offX * scale), by + (offY * scale), nil, scale * scaleMod)
end
