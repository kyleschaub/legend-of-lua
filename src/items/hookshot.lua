hookshot = {}
hookshot.x = 0
hookshot.y = 0
hookshot.handleX = 0
hookshot.handleY = 0
hookshot.timer = 0
hookshot.maxTimer = 0.5
hookshot.dirVec = getDirectionVector('down')
hookshot.rot = getRotationFromDir('down')
hookshot.rad = 3
hookshot.speed = 160
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
    hookshot.dirVec = getDirectionVector(dir)
    hookshot.rot = getRotationFromDir(dir)

    hookshot.x = player:getX()
    hookshot.y = player:getY()

    -- offset based on direction
    if hookshot.dir == "right" then
        hookshot.x = hookshot.x + 10
        hookshot.y = hookshot.y + 2
        hookshot.handleX = hookshot.x - 4
        hookshot.handleY = hookshot.y
    elseif hookshot.dir == "left" then
        hookshot.x = hookshot.x - 10
        hookshot.y = hookshot.y + 2
        hookshot.handleX = hookshot.x + 4
        hookshot.handleY = hookshot.y
    elseif hookshot.dir == "down" then
        hookshot.x = hookshot.x + 3
        hookshot.y = hookshot.y + 9
        hookshot.handleX = hookshot.x
        hookshot.handleY = hookshot.y - 3
    elseif hookshot.dir == "up" then
        hookshot.y = hookshot.y - 8
        hookshot.handleX = hookshot.x
        hookshot.handleY = hookshot.y + 2
    end

end

function hookshot:update(dt)

    self.timer = self.timer - dt
    if self.timer < 0 then
        self.timer = 0
        if self.state == 1 then self.state = -1 end
    end

    if self.state == 1 or self.state == -1 then
        self.x = self.x + (self.dirVec.x * self.speed * dt) * self.state
        self.y = self.y + (self.dirVec.y * self.speed * dt) * self.state
    end

    if self.state == 2 then
        self.handleX = self.handleX + (self.dirVec.x * self.speed * dt)
        self.handleY = self.handleY + (self.dirVec.y * self.speed * dt)

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
    end

end

function hookshot:draw(layer)
    if self.state == 0 then return end

    -- Always draw the chains in layer -1
    local chainSpr = sprites.items.hookshotChain
    if layer == -1 then
        local dist = distanceBetween(hookshot.handleX, hookshot.handleY, hookshot.x, hookshot.y)
        local interval = dist / hookshot.chainCount
        for i = 1, hookshot.chainCount do
            local offX = interval * i * hookshot.dirVec.x
            local offY = interval * i * hookshot.dirVec.y
            love.graphics.draw(chainSpr, self.handleX + offX, self.handleY + offY, self.rot, nil, nil, chainSpr:getWidth()/2, chainSpr:getHeight()/2)
        end
    end

    local hookSpr = sprites.items.hookshotHead
    if (layer == -1 and self.dir == 'up') or (layer == 1 and self.dir ~= 'up') then
        love.graphics.draw(hookSpr, self.x, self.y, self.rot, nil, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end
end
