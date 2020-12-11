-- water contains many tables, one for each segment type
water = {}

water.grid = anim8.newGrid(96, 96, sprites.env.water:getWidth(), sprites.env.water:getHeight(), 0, 0, 6)

local waterSpeed = 0.75
water.u = {}
water.u.anim = anim8.newAnimation(water.grid('1-2', 4), waterSpeed)
water.l = {}
water.l.anim = anim8.newAnimation(water.grid('1-2', 2), waterSpeed)
water.r = {}
water.r.anim = anim8.newAnimation(water.grid('1-2', 7), waterSpeed)
water.d = {}
water.d.anim = anim8.newAnimation(water.grid('1-2', 5), waterSpeed)
water.ul = {}
water.ul.anim = anim8.newAnimation(water.grid('1-2', 1), waterSpeed)
water.ur = {}
water.ur.anim = anim8.newAnimation(water.grid('1-2', 6), waterSpeed)
water.dl = {}
water.dl.anim = anim8.newAnimation(water.grid('1-2', 3), waterSpeed)
water.dr = {}
water.dr.anim = anim8.newAnimation(water.grid('1-2', 8), waterSpeed)
water.c = {}
water.c.anim = anim8.newAnimation(water.grid('1-2', 9), waterSpeed)

function water:update(dt)
    water.u.anim:update(dt)
    water.l.anim:update(dt)
    water.r.anim:update(dt)
    water.d.anim:update(dt)
    water.ul.anim:update(dt)
    water.ur.anim:update(dt)
    water.dl.anim:update(dt)
    water.dr.anim:update(dt)
    water.c.anim:update(dt)
end

function water:createSegment(x, y, width, height, segmentType, biome)
    local segment = {}
    segment.x = x
    segment.y = y
    segment.width = width
    segment.height = height
    segment.segmentType = segmentType
    segment.biome = biome
    
    table.insert(water[segmentType], segment)
end

function water:draw()
    drawSegments(water.u)
    drawSegments(water.l)
    drawSegments(water.r)
    drawSegments(water.d)
    drawSegments(water.ul)
    drawSegments(water.ur)
    drawSegments(water.dl)
    drawSegments(water.dr)
    drawSegments(water.c)
end

function drawSegments(segmentTable)

    for i,s in ipairs(segmentTable) do

        if s.segmentType == 'c' then
            local w = s.width/96 - 1
            local h = s.height/96 - 1

            for i=0,w do
                for j=0,h do
                    local ox = i * 96
                    local oy = j * 96
                    segmentTable.anim:draw(sprites.env.water, s.x + ox, s.y + oy)
                end
            end

        else

            local count = 0
            local horizontal = false

            if s.width > s.height then
                count = s.width / 96
                horizontal = true
            end

            if s.height > s.width then
                count = s.height / 96
            end

            for i=0,count do
                local ox = 0
                local oy = 0

                if horizontal then
                    ox = i * 96
                else
                    oy = i * 96
                end

                --love.graphics.draw(segmentTable.img, s.x + ox, s.y + oy)
                segmentTable.anim:draw(sprites.env.water, s.x + ox, s.y + oy)
            end

        end

    end

end