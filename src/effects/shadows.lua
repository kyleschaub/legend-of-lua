function drawShadows()

    local spr = sprites.effects.treeShadow
    for _,t in ipairs(trees) do
        love.graphics.draw(spr, t.x + t.width/2, t.y+8, nil, nil, nil, spr:getWidth()/2, spr:getHeight()/2)
    end

    spr = sprites.effects.boomerangShadow
    if boomerang.state > 0 then
        love.graphics.draw(spr, boomerang.x, boomerang.y+6, nil, 0.8, nil, spr:getWidth()/2, spr:getHeight()/2)
    end

    spr = sprites.effects.arrowShadow
    for _,a in ipairs(arrows) do
        love.graphics.draw(spr, a.x, a.y+5, a.rot, nil, nil, spr:getWidth()/2, spr:getHeight()/2)
    end

    spr = sprites.effects.boomerangShadow
    for _,f in ipairs(fireballs) do
        love.graphics.draw(spr, f.x, f.y+6, nil, 0.8, nil, spr:getWidth()/2, spr:getHeight()/2)
    end

end
