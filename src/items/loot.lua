loots = {}

function spawnLoot(x, y, type, bounce, price, dir)
    
    local loot = {}
    loot.x = x
    loot.y = y
    loot.type = type
    loot.rot = 0
    loot.dead = false
    loot.bouncing = false
    loot.bounceY = 0 -- used for bounce animation when spawned
    loot.shadowSpr = sprites.items.lootShadow
    loot.shop = shop
    loot.dir = dir
    loot.hookVec = nil
    loot.boomeranged = false
    loot.sound = sounds.items.coin

    loot.price = 0
    if price and price > 0 then
        loot.price = price
    end

    if loot.type == "arrow" then
        loot.spr = sprites.items.arrow
        loot.rot = math.pi/-2
    elseif loot.type == "bomb" then
        loot.spr = sprites.items.bomb
    elseif loot.type == "key" then
        loot.spr = sprites.items.key
    elseif loot.type == "coin1" then
        loot.spr = sprites.items.coin1
        loot.frameW = 8
        loot.frameH = 8
        loot.grid = anim8.newGrid(loot.frameW, loot.frameH, loot.spr:getWidth(), loot.spr:getHeight())
        loot.anim = anim8.newAnimation(loot.grid('1-4', 1), 0.2)
        loot.shadowSpr = sprites.items.lootShadow2
    elseif loot.type == "coin2" then
        loot.spr = sprites.items.coin2
        loot.frameW = 8
        loot.frameH = 8
        loot.grid = anim8.newGrid(loot.frameW, loot.frameH, loot.spr:getWidth(), loot.spr:getHeight())
        loot.anim = anim8.newAnimation(loot.grid('1-4', 1), 0.2)
        loot.shadowSpr = sprites.items.lootShadow2
    elseif loot.type == "coin3" then
        loot.spr = sprites.items.coin3
        loot.frameW = 8
        loot.frameH = 8
        loot.grid = anim8.newGrid(loot.frameW, loot.frameH, loot.spr:getWidth(), loot.spr:getHeight())
        loot.anim = anim8.newAnimation(loot.grid('1-4', 1), 0.2)
        loot.shadowSpr = sprites.items.lootShadow2
    elseif loot.type == "heart" then
        loot.spr = sprites.items.heart
        --[[
        Animated heart that rotates, decided not to include
        loot.frameW = 13
        loot.frameH = 12
        loot.grid = anim8.newGrid(loot.frameW, loot.frameH, loot.spr:getWidth(), loot.spr:getHeight())
        loot.anim = anim8.newAnimation(loot.grid('1-4', 1), 0.18)
        ]]
    elseif loot.type == "sword2" then
        loot.spr = sprites.items.sword2
        loot.rot = math.pi/-2
    elseif loot.type == "container" then
        loot.spr = sprites.items.container
    elseif loot.type == "quiver" then
        loot.spr = sprites.items.quiver
    else
        return -- invalid spawn loot
    end

    function loot:update(dt)
        if self.anim then
            self.anim:update(dt)
        end
        if self.bouncing and self.dir then
            self.x = self.x + self.dir.x * dt
            self.y = self.y + self.dir.y * dt
        end
        if distanceBetween(self.x, self.y, player:getX(), player:getY()) < 10 and self.dead == false and self.bouncing == false then
            if self.price > 0 then
                if data.money >= self.price then
                    data.money = data.money - self.price
                else
                    return nil
                end
            end

            dj.play(self.sound, "static", "effect")

            self.dead = true
            if self.type == "arrow" then
                data.arrowCount = data.arrowCount + 1
                if data.arrowCount > data.maxArrowCount then data.arrowCount = data.maxArrowCount end
            elseif self.type == "bomb" then
                data.bombCount = data.bombCount + 1
                if data.bombCount > data.maxBombCount then data.bombCount = data.maxBombCount end
            elseif self.type == "key" then
                data.keys = data.keys + 1
            elseif self.type == "coin1" then
                data.money = data.money + 1
            elseif self.type == "coin2" then
                data.money = data.money + 5
            elseif self.type == "coin3" then
                data.money = data.money + 10
            elseif self.type == "heart" then
                player.health = player.health + 1
                if player.health > data.maxHealth then player.health = data.maxHealth end
            end

            if self.price > 0 then
                player:gotItem(self.spr)
            end
        end

        if self.hookVec and grapple.state == -1 then
            self.x = self.x + (self.hookVec.x * grapple.speed * -1 * dt)
            self.y = self.y + (self.hookVec.y * grapple.speed * -1 * dt)
        end

        if self.boomeranged then
            self.x = boomerang.x
            self.y = boomerang.y - 4
        end
    end

    function loot:draw()
        setWhite()

        love.graphics.draw(self.shadowSpr, self.x, self.y+4.5, nil, nil, nil, self.shadowSpr:getWidth()/2, self.shadowSpr:getHeight()/2)
        local offY = 0
        if self.type == "arrow" then offY = -2 end
        if self.type == "key" then offY = -1.5 end
        if self.type == "coin1" or self.type == "coin2" or self.type == "coin3" then offY = 2 end
        if self.type == "sword2" then offY = -2.5 end
        if self.type == "container" then offY = -0.5 end
        if self.type == "quiver" then offY = -3.5 end

        if self.anim then
            self.anim:draw(self.spr, self.x, self.y + offY + self.bounceY, nil, nil, nil, self.frameW/2, self.frameH/2)
        else
            love.graphics.draw(self.spr, self.x, self.y + offY + self.bounceY, self.rot, nil, nil, self.spr:getWidth()/2, self.spr:getHeight()/2)
        end

        if self.price > 0 then
            love.graphics.setFont(fonts.shop)
            love.graphics.printf(self.price, self.x-10, self.y+5, 20, "center")
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
