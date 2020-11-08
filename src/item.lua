items = {}

function spawnItem(type, id, x, y)

    local item = {}
    item.type = type
    item.id = id
    item.x = x
    item.y = y
    item.collected = false

    if item.type == "sword" then
        local weaponStats = getWeaponStats(item.type, item.id)
        item.sprite = weaponStats.sprite
    end

    table.insert(items, item)

end

function items:update()

    for i=#items,1,-1 do
        local a = items[i]
        if a.collected == true then
            table.remove(items, i)
        end
    end

end

function drawItems()

    love.graphics.setColor(1,1,1,1)
    for i,a in ipairs(items) do
        love.graphics.draw(a.sprite, a.x, a.y, 3*math.pi/2, 1, 1, a.sprite:getWidth()/2, a.sprite:getHeight()/2)
    end

end