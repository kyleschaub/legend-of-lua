flames = {}

function spawnFlame(x, y)
    local direction = toMouseVector(x, y)

    local flame = {}
    flame.x = x
    flame.y = y
    flame.timer = -1
    flame.emberTimer = 0.1
    flame.dead = false
    flame.dir = direction
    flame.dirVec = direction
    flame.rot = math.atan2(direction.y, direction.x)
    flame.rad = 3
    flame.state = 0

    dj.play(sounds.items.fire, "static", "effect")

    effects:spawn("triangleScorch", flame.x+2, flame.y+2, flame.dir)

    function flame:singleEmber(newVec, offVec, offMag)
        for i=1,3 do
            local emberScale = 0.85
            local rad = 6
            local offX = math.random()*rad
            local offY = math.random()*rad

            offVec = offVec:normalized()
            offVec = offVec * offMag

            effects:spawn("flameSmoke", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = 0.8})
            local offX = math.random()*rad
            local offY = math.random()*rad
            effects:spawn("ember", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = emberScale})
            local offX = math.random()*rad
            local offY = math.random()*rad
            effects:spawn("ember", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = emberScale})
            local offX = math.random()*rad
            local offY = math.random()*rad
            effects:spawn("ember", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = emberScale})
            local offX = math.random()*rad
            local offY = math.random()*rad
            effects:spawn("ember", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = emberScale})
        end
    end

    function flame:fullEmber()
        --[[effects:spawn("fireballSmoke", self.x, self.y, {scale = 0.8})
        effects:spawn("ember", self.x, self.y, {scale = emberScale})
        effects:spawn("ember", self.x, self.y, {scale = emberScale})
        effects:spawn("ember", self.x, self.y, {scale = emberScale})
        effects:spawn("ember", self.x, self.y, {scale = emberScale})]]
        self.emberTimer = 0.035

        local mag = 12 + 6 * self.state
        local newVec = self.dir * mag
        local noVec = vector(0, 0)
        local leftVec = newVec:rotated(math.pi/-2):normalized()
        local rightVec = newVec:rotated(math.pi/2):normalized()
        local iter = 5

        if self.state >= 0 then
            flame:singleEmber(newVec, noVec, 0)
            flame:singleEmber(newVec, leftVec, iter*1)
            flame:singleEmber(newVec, rightVec, iter*1)
        end
        if self.state >= 2 then
            flame:singleEmber(newVec, leftVec, iter*2)
            flame:singleEmber(newVec, rightVec, iter*2)
        end
        if self.state >= 4 then
            flame:singleEmber(newVec, leftVec, iter*3)
            flame:singleEmber(newVec, rightVec, iter*3)
        end
        if self.state >= 6 then
            flame:singleEmber(newVec, leftVec, iter*4)
            flame:singleEmber(newVec, rightVec, iter*4)
        end
    end

    function flame:update(dt)
        local iterTime = 0.05
        self.timer = self.timer - dt
        if self.timer < 0 then
            self.state = self.state + 1
            flame:hit()
            self.timer = iterTime
            if self.state >= 8 then
                self.dead = true
            end
        end

        self.emberTimer = self.emberTimer - dt
        if self.emberTimer < 0 and self.dead == false then
            flame:fullEmber()
        end
    end

    function flame:hit()
        local px, py = player:getPosition()
        local polygon = nil
        local mag = nil
        local mag2 = nil
        local width = 18

        if self.state == 1 then
            mag = 14 + 6 * self.state
            width = 18
        elseif self.state == 2 then
            mag = 14 + 6 * self.state + 4
            width = 28
        elseif self.state == 4 then
            mag = 14 + 6 * self.state + 4
            width = 38
        elseif self.state == 6 then
            mag = 14 + 6 * self.state + 4
            width = 48
        end

        if mag then
            mag2 = mag - 8
            local newVec = self.dir * mag
            local newVec2 = self.dir * mag2
            local leftVec = newVec:rotated(math.pi/-2):normalized()
            local rightVec = newVec:rotated(math.pi/2):normalized()
            
            polygon = {
                px + newVec.x + leftVec.x*width/2,
                py + newVec.y + leftVec.y*width/2,
                px + newVec.x + rightVec.x*width/2,
                py + newVec.y + rightVec.y*width/2,
                px + newVec2.x + rightVec.x*width/2,
                py + newVec2.y + rightVec.y*width/2,
                px + newVec2.x + leftVec.x*width/2,
                py + newVec2.y + leftVec.y*width/2,
            }
        end

        if polygon then
            local hitEnemies = world:queryPolygonArea(polygon, {'Enemy'})
            for _,e in ipairs(hitEnemies) do
                local knockbackDir = self.dir
                e.parent:burn()
                e.parent:hit(0.5, knockbackDir, 0.06)
            end
        end
    end

    flame:fullEmber()
    table.insert(flames, flame)
end

function flames:update(dt)
    for _,b in ipairs(flames) do
        b:update(dt)
    end

    local i = #flames
    while i > 0 do
        if flames[i].dead then
            table.remove(flames, i)
        end
        i = i - 1
    end
end

function flames:draw(layer)
    for _,a in ipairs(flames) do

    end
end
