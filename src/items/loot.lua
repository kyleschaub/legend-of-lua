loots = {}

function spawnLoot(x, y, type, bounce)
    local loot = {}
    loot.x = x
    loot.y = y
    loot.type = type
    loot.rot = 0
    loot.dead = false
    loot.bouncing = false
    loot.bounceY = 0 -- used for bounce animation when spawned

    if loot.type == "arrow" then
        loot.spr = sprites.items.arrow
        loot.rot = math.pi/-2
    elseif loot.type == "bomb" then
        loot.spr = sprites.items.bomb
    elseif loot.type == "heart" then
        loot.spr = sprites.items.heart
        --[[
        Animated heart that rotates, decided not to include
        loot.frameW = 13
        loot.frameH = 12
        loot.grid = anim8.newGrid(loot.frameW, loot.frameH, loot.spr:getWidth(), loot.spr:getHeight())
        loot.anim = anim8.newAnimation(loot.grid('1-4', 1), 0.18)
        ]]
    else
        return -- invalid spawn loot
    end

    function loot:update(dt)
        if self.anim then
            self.anim:update(dt)
        end
        if distanceBetween(self.x, self.y, player:getX(), player:getY()) < 10 and self.dead == false and self.bouncing == false then
            self.dead = true
            if self.type == "arrow" then
                data.arrowCount = data.arrowCount + 1
                if data.arrowCount > data.maxArrowCount then data.arrowCount = data.maxArrowCount end
            elseif self.type == "bomb" then
                data.bombCount = data.bombCount + 1
                if data.bombCount > data.maxBombCount then data.bombCount = data.maxBombCount end
            elseif self.type == "heart" then
                player.health = player.health + 1
                if player.health > data.maxHealth then player.health = data.maxHealth end
            end
        end
    end

    function loot:draw()
        setWhite()
        love.graphics.draw(sprites.items.lootShadow, self.x, self.y+4.5, nil, nil, nil, sprites.items.lootShadow:getWidth()/2, sprites.items.lootShadow:getHeight()/2)
        local offY = 0
        if self.type == "arrow" then offY = -2 end
        if self.anim then
            self.anim:draw(self.spr, self.x, self.y + offY + self.bounceY, nil, nil, nil, self.frameW/2, self.frameH/2)
        else
            love.graphics.draw(self.spr, self.x, self.y + offY + self.bounceY, self.rot, nil, nil, self.spr:getWidth()/2, self.spr:getHeight()/2)
        end
    end

    if bounce then
        loot.bouncing = true
        local finishBounce = function()
            loot.bouncing = false
        end
        local fall = function()
            flux.to(loot, 0.25, {bounceY = 0}):ease('quadin'):oncomplete(finishBounce)
        end
        flux.to(loot, 0.25, {bounceY = -16}):ease('quadout'):oncomplete(fall)
    end

    table.insert(loots, loot)
end

function loots:update(dt)
    for _,l in ipairs(loots) do
        l:update(dt)
    end

    local i = #loots
    while i > 0 do
        if loots[i].dead then
            table.remove(loots, i)
        end
        i = i - 1
    end
end

function loots:draw()
    for _,l in ipairs(loots) do
        l:draw()
    end
end
