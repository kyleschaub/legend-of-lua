transitions = {}

function spawnTransition(x, y, width, height, id, destX, destY, transitionType)

    local transition = world:newRectangleCollider(x, y, width, height, {collision_class = "Transition"})
    transition:setType('static')

    transition.id = id
    transition.destX = destX
    transition.destY = destY
    transition.type = "standard"

    if transitionType then transition.type = transitionType end

    table.insert(transitions, transition)

end

function triggerTransition(id, destX, destY)
    local newMap = "test"

    if id == "toTestShop" then
        newMap = "testShop"
    elseif id == "toTest" then
        newMap = "test"
    elseif id == "toTest2" then
        newMap = "test2"
    elseif id == "toTest3" then
        newMap = "test3"
    elseif id == "toTestCave" then
        newMap = "testCave"
    elseif id == "toTestCave2" then
        newMap = "testCave2"
    elseif id == "toTest4" then
        newMap = "test4"
    elseif id == "toPlayerHouse" then
        newMap = "playerHouse"
    elseif id == "toTest7" then
        newMap = "test7"
    elseif id == "toDungeon2" then
        newMap = "testDungeon2"
    elseif id == "toDungeon2-2" then
        newMap = "testDungeon2-2"
    else
        newMap = id
    end

    gamestate = 1
    player:setPosition(destX, destY)

    loadMap(newMap)
end
