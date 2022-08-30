function drawShadows()

    local spr = sprites.effects.treeShadow
    for _,t in ipairs(trees) do
        love.graphics.draw(spr, t.x + t.width/2, t.y+8, nil, nil, nil, spr:getWidth()/2, spr:getHeight()/2)
    end

end
