transitions = {}

function spawnTransition(x, y, width, height, id, destX, destY)

    local transition = world:newRectangleCollider(x, y, width, height, {collision_class = "Transition"})
    transition:setType('static')

    transition.id = id
    transition.destX = destX
    transition.destY = destY

    table.insert(transitions, transition)

end

function triggerTransition(id, destX, destY)
    local newMap = "test"

    if id == "toTestShop" then
        newMap = "testShop"
    elseif id == "toTest" then
        newMap = "test"
    elseif id == "toTestCave" then
        newMap = "testCave"
    elseif id == "toTest4" then
        newMap = "test4"

    -- if the id is the name of a map, use it
    elseif(fileExists("maps/" .. id .. ".lua")) then
            newMap = id
    end

    player:setPosition(destX, destY)

    loadMap(newMap)
end
