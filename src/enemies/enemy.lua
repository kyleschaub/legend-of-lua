enemies = {}

function spawnEnemy(x, y, type, args)

    local enemy = {}

    enemy.type = type
    enemy.dead = false
    enemy.stamp = "enemy"
    enemy.health = 3
    enemy.flashTimer = 0

    -- Function that sets the properties of the new enemy
    local init
    if type == "eye" then
        init = require("src/enemies/eye")
    elseif type == "bat" then
        init = require("src/enemies/bat")
    end

    enemy = init(enemy, x, y, args)

    -- This update function is the same for all enemies, regardless of type
    function enemy:genericUpdate(dt)
        if self.flashTimer > 0 then
            self.flashTimer = self.flashTimer - dt
            if self.flashTimer < 0 then
                self.flashTimer = 0
            end
        end
    end

    table.insert(enemies, enemy)

end

function enemies:update(dt)

    -- Calls update functions on all enemies
    for i,e in ipairs(self) do
        e:update(dt)
        e:genericUpdate(dt)
    end
  
    -- Iterate through all enemies in reverse to remove the dead ones
    for i=#enemies,1,-1 do
        if enemies[i].dead then
            if enemies[i].physics ~= nil then
                enemies[i].physics:destroy()
            end
            table.remove(enemies, i)
        end
    end
  
end

-- Draw all enemies
function enemies:draw()
    for i,e in ipairs(self) do
        e:draw()
    end
end

function enemies:destroyDead()
    local i = #enemies
    while i > 0 do
        if enemies[i].dead then
            if enemies[i].physics then
                enemies[i].physics:destroy()
            end
            table.remove(enemies, i)
        end
        i = i - 1
    end
end

function spawnEnemyLoot(x, y)
    -- TODO: this code is not good, make a proper loot-rolling system
    if math.random() > 0.5 then
        --return -- 50/50 no loot
    end
    local lootType = "arrow"
    local randCheck = math.random()
    if player.health < data.maxHealth then
        if randCheck < 0.33 then
            lootType = "heart"
        elseif randCheck < 0.66 then
            lootType = "bomb"
        end
    else
        if randCheck < 0.5 then
            lootType = "bomb"
        end
    end
    spawnLoot(x, y, lootType, true)
end
