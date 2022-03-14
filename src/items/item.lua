function useItem()
    if data.item == 1 then
        player:useBoomerang()
    elseif data.item == 2 then
        player:useBomb()
    elseif data.item == 3 then
        player:useBow()
    end
end
