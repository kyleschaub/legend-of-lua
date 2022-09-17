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

    function flame:singleEmber(newVec, offVec, offMag)
        for i=1,3 do
            local emberScale = 0.85
            local rad = 6
            local offX = math.random()*rad
            local offY = math.random()*rad

            offVec = offVec:normalized()
            offVec = offVec * offMag

            effects:spawn("fireballSmoke", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = 0.8})
            effects:spawn("ember", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = emberScale})
            effects:spawn("ember", self.x + newVec.x + offX + offVec.x, self.y + newVec.y + offY + offVec.y, {scale = emberScale})
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

        local mag = 10 + 10 * self.state
        local newVec = self.dir * mag
        local noVec = vector(0, 0)
        local leftVec = newVec:rotated(math.pi/-2):normalized()
        local rightVec = newVec:rotated(math.pi/2):normalized()
        local iter = 5

        if self.state == 0 then
            flame:singleEmber(newVec, noVec, 0)
            flame:singleEmber(newVec, leftVec, iter*1)
            flame:singleEmber(newVec, rightVec, iter*1)
        elseif self.state == 1 then
            flame:singleEmber(newVec, noVec, 0)
            flame:singleEmber(newVec, leftVec, iter*1)
            flame:singleEmber(newVec, rightVec, iter*1)
            flame:singleEmber(newVec, leftVec, iter*2)
            flame:singleEmber(newVec, rightVec, iter*2)
        elseif self.state == 2 then
            flame:singleEmber(newVec, noVec, 0)
            flame:singleEmber(newVec, leftVec, iter*1)
            flame:singleEmber(newVec, rightVec, iter*1)
            flame:singleEmber(newVec, leftVec, iter*2)
            flame:singleEmber(newVec, rightVec, iter*2)
            flame:singleEmber(newVec, leftVec, iter*3)
            flame:singleEmber(newVec, rightVec, iter*3)
        elseif self.state == 3 then
            flame:singleEmber(newVec, noVec, 0)
            flame:singleEmber(newVec, leftVec, iter*1)
            flame:singleEmber(newVec, rightVec, iter*1)
            flame:singleEmber(newVec, leftVec, iter*2)
            flame:singleEmber(newVec, rightVec, iter*2)
            flame:singleEmber(newVec, leftVec, iter*3)
            flame:singleEmber(newVec, rightVec, iter*3)
            flame:singleEmber(newVec, leftVec, iter*4)
            flame:singleEmber(newVec, rightVec, iter*4)
        end
    end

    function flame:update(dt)
        local iterTime = 0.15
        self.timer = self.timer - dt
        if self.timer < 0 then
            self.state = self.state + 1
            if self.state == 1 then
                -- spawn first row
                self.timer = iterTime
            elseif self.state == 2 then
                -- spawn second row
                self.timer = iterTime
            elseif self.state == 3 then
                -- spawn third row
                self.timer = iterTime
            elseif self.state == 4 then
                -- spawn fourth row
                self.timer = iterTime
            else
                self.dead = true
            end
        end

        self.emberTimer = self.emberTimer - dt
        if self.emberTimer < 0 and self.dead == false then
            flame:fullEmber()
        end

        -- Query for enemies
        local hitEnemies = world:queryCircleArea(self.x, self.y, self.rad, {'Enemy'})
        for _,e in ipairs(hitEnemies) do
            e.parent:hit(1, self.dirVec, 0.1)
        end
        if #hitEnemies > 0 then self.dead = true end

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
