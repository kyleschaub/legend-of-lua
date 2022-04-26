triggers = {}

function spawnTrigger(x, y, id)
    local trigger = {}
    trigger.x = x
    trigger.y = y
    trigger.id = id
    trigger.rad = 1
    trigger.dead = false

    if id == "batTrigger" then
        trigger.rad = 50

        function trigger:activate()
            spawnEnemy(trigger.x, trigger.y, "bat")
        end
    end

    function trigger:update(dt)
        if distanceBetween(self.x, self.y, player:getX(), player:getY()) < self.rad and self.dead == false then
            self.dead = true
            self.activate()
            d1 = d1 + 10
        end
    end

    table.insert(triggers, trigger)
end

function triggers:update(dt)
    for _,t in ipairs(triggers) do
        t:update(dt)
    end
end
