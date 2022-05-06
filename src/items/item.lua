function useItem()

    if not canUseItem(data.item) then
        shake:start(0.2, 0.2, 0.03)
        return
    end

    if data.item == 1 then
        player:useBoomerang()
    elseif data.item == 2 then
        player:useBomb()
    elseif data.item == 3 then
        player:useBow()
    end
end

function canUseItem(itemId)
    if itemId == 1 then
        return boomerang.state == 0
    elseif itemId == 2 then
        return data.bombCount > 0
    elseif itemId == 3 then
        return data.arrowCount > 0
    else return true
    end
end