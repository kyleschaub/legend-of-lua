hookshot = {}
hookshot.x = 0
hookshot.y = 0
hookshot.handleX = 0
hookshot.handleY = 0
hookshot.timer = 0
hookshot.maxTimer = 0.4
hookshot.dirVec = getDirectionVector('down')
hookshot.rot = getRotationFromDir('down')
hookshot.rad = 3
hookshot.speed = 200
hookshot.chainCount = 10

-- 0: inactive
-- 1: away
-- 2: hooked
-- -1: return
hookshot.state = 0

function hookshot:shoot(dir)

    hookshot.state = 1
    hookshot.timer = hookshot.maxTimer
    hookshot.dir = dir
    hookshot.rot = getRotationFromVector(dir)

    hookshot.x = player:getX()
    hookshot.y = player:getY()

    hookshot.handleX = hookshot.x + dir.x*3
    hookshot.handleY = hookshot.y + dir.y*3

    dj.play(sounds.items.grapple, "static", "effect")

end

function hookshot:update(dt)

    self.timer = self.timer - dt
    if self.timer < 0 then
        self.timer = 0
        if self.state == 1 then self.state = -1 end
    end

    if self.state == 1 or self.state == -1 then
        self.x = self.x + (self.dir.x * self.speed * dt) * self.state
        self.y = self.y + (self.dir.y * self.speed * dt) * self.state
    end

    if self.state == 2 then
        self.handleX = self.handleX + (self.dir.x * self.speed * dt)
        self.handleY = self.handleY + (self.dir.y * self.speed * dt)

        if distanceBetween(player:getX(), player:getY(), hookshot.x, hookshot.y) < 12 then
            hookshot.state = 0
            player.state = 0
            player:resetAnimation(player.dir)
            player:setCollisionClass('Player')
        end
    end

    if self.state == 1 then
        -- Query for walls
        local walls = world:queryCircleArea(self.x, self.y, self.rad, {'Wall'})
        if #walls > 0 then
            self.state = 2
            player.state = 4.2
            player:setCollisionClass('Ignore')
        end

        -- Query for enemies
        local hitEnemies = world:queryCircleArea(self.x, self.y, self.rad, {'Enemy'})
        for _,e in ipairs(hitEnemies) do
            if e.parent.hookable then
                e.parent.dizzyTimer = 1
                e.parent.hookVec = hookshot.dir
            end
            hookshot.state = -1
        end

        for _,l in ipairs(loots) do
            if distanceBetween(l.x, l.y, hookshot.x, hookshot.y) < 10 then
                self.state = -1
                l.hookVec = hookshot.dir
            end
        end
    end

end

function hookshot:draw(layer)
    if self.state == 0 then return end

    -- Always draw the chains in layer -1
    local chainSpr = sprites.items.hookshotChain
    if layer == -1 then
        --[[
        local dist = distanceBetween(hookshot.handleX, hookshot.handleY, hookshot.x, hookshot.y)
        local interval = dist / hookshot.chainCount
        for i = 1, hookshot.chainCount do
            local offX = interval * i * hookshot.dir.x
            local offY = interval * i * hookshot.dir.y
            love.graphics.draw(chainSpr, self.handleX + offX, self.handleY + offY, self.rot, nil, nil, chainSpr:getWidth()/2, chainSpr:getHeight()/2)
        end
        ]]

        --love.graphics.setColor(115/255, 95/255, 75/255)
        love.graphics.setColor(26/255,26/255,26/255,1)
        love.graphics.setLineWidth(2)
        --love.graphics.line(hookshot.handleX, hookshot.handleY, hookshot.x, hookshot.y)
        love.graphics.setColor(179/255, 147/255, 116/255)
        --love.graphics.setColor(115/255, 95/255, 75/255)
        love.graphics.setColor(0.1,0.1,0.1,1)
        love.graphics.setLineWidth(0.9)
        love.graphics.line(hookshot.handleX, hookshot.handleY, hookshot.x, hookshot.y)
        setWhite()
    end

    local hookSpr = sprites.items.hookshotHead
    if (layer == -1 and self.dir == 'up') or (layer == 1 and self.dir ~= 'up') then
        love.graphics.draw(hookSpr, self.x, self.y, self.rot, nil, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end
end
