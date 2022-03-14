function drawHUD()
    drawHearts()
    drawItemBox()
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

    local spr = sprites.items.boomerang
    local offX = -1.5
    local offY = -1.5
    local scaleMod = 1.25
    if data.item == 1 then -- boomerang
        spr = sprites.items.boomerang
    elseif data.item == 2 then -- bomb
        spr = sprites.items.bomb
        offX = 2.3
        offY = 2.8
        scaleMod = 1.1
    end
    love.graphics.draw(spr, bx + (offX * scale), by + (offY * scale), nil, scale * scaleMod)
end
