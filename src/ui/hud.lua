function drawHUD()
    for i = 0, data.maxHealth-1 do
        local heartSpr = sprites.hud.emptyHeart
        if player.health - i == 0.5 then
            heartSpr = sprites.hud.halfHeart
        elseif player.health > i then
            heartSpr = sprites.hud.heart
        end
        love.graphics.draw(heartSpr, 6 + (i * 84), 6, nil, scale)
    end
end
