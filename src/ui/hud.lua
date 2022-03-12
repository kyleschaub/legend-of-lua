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
    local bx = 6
    local by = 16*scale
    love.graphics.setColor(0,0,0, 0.35)
    love.graphics.rectangle("fill", bx+1, by+1, 16*scale, 16*scale)
    setWhite()
    love.graphics.draw(sprites.hud.itemBox, bx, by, nil, scale)

    if data.item == 1 then -- boomerang
        love.graphics.draw(sprites.items.boomerang, bx, by, nil, scale)
    elseif data.item == 2 then -- bomb
        love.graphics.draw(sprites.items.bomb, bx, by, nil, scale)
    end
end
