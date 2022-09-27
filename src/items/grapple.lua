grapple = {}
grapple.x = 0
grapple.y = 0
grapple.handleX = 0
grapple.handleY = 0
grapple.timer = 0
grapple.maxTimer = 0.4
grapple.dirVec = getDirectionVector('down')
grapple.rot = getRotationFromDir('down')
grapple.rad = 3
grapple.speed = 200
grapple.chainCount = 10

-- 0: inactive
-- 1: away
-- 2: hooked
-- -1: return
grapple.state = 0

function grapple:shoot(dir)

    grapple.state = 1
    grapple.timer = grapple.maxTimer
    grapple.dir = dir
    grapple.rot = getRotationFromVector(dir)

    grapple.x = player:getX()
    grapple.y = player:getY()

    grapple.handleX = grapple.x + dir.x*3
    grapple.handleY = grapple.y + dir.y*3

    dj.play(sounds.items.grapple, "static", "effect")

end

function grapple:update(dt)

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

        if distanceBetween(player:getX(), player:getY(), grapple.x, grapple.y) < 12 then
            grapple.state = 0
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
            dj.play(sounds.items.set, "static", "effect")
            player.state = 4.2
            player:setCollisionClass('Ignore')
        end

        -- Query for enemies
        local hitEnemies = world:queryCircleArea(self.x, self.y, self.rad, {'Enemy'})
        for _,e in ipairs(hitEnemies) do
            if e.parent.hookable then
                e.parent.dizzyTimer = 1
                e.parent.hookVec = grapple.dir
            end
            grapple.state = -1
        end

        for _,l in ipairs(loots) do
            if distanceBetween(l.x, l.y, grapple.x, grapple.y) < 10 then
                self.state = -1
                l.hookVec = grapple.dir
            end
        end
    end

end

function grapple:draw(layer)
    if self.state == 0 then return end

    -- Always draw the chains in layer -1
    local chainSpr = sprites.items.grappleChain
    if layer == -1 then
        --[[
        local dist = distanceBetween(grapple.handleX, grapple.handleY, grapple.x, grapple.y)
        local interval = dist / grapple.chainCount
        for i = 1, grapple.chainCount do
            local offX = interval * i * grapple.dir.x
            local offY = interval * i * grapple.dir.y
            love.graphics.draw(chainSpr, self.handleX + offX, self.handleY + offY, self.rot, nil, nil, chainSpr:getWidth()/2, chainSpr:getHeight()/2)
        end
        ]]

        --love.graphics.setColor(115/255, 95/255, 75/255)
        love.graphics.setColor(26/255,26/255,26/255,1)
        love.graphics.setLineWidth(2)
        --love.graphics.line(grapple.handleX, grapple.handleY, grapple.x, grapple.y)
        love.graphics.setColor(179/255, 147/255, 116/255)
        --love.graphics.setColor(115/255, 95/255, 75/255)
        love.graphics.setColor(0.1,0.1,0.1,1)
        love.graphics.setLineWidth(0.9)
        love.graphics.line(grapple.handleX, grapple.handleY, grapple.x, grapple.y)
        setWhite()
    end

    local hookSpr = sprites.items.grappleHead
    if (layer == -1 and self.dir == 'up') or (layer == 1 and self.dir ~= 'up') then
        love.graphics.draw(hookSpr, self.x, self.y, self.rot, nil, nil, hookSpr:getWidth()/2, hookSpr:getHeight()/2)
    end
end
