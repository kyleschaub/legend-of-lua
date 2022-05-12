function useItem(key)
    if data.item[key] == 1 then
        player:swingSword()
    elseif data.item[key] == 2 then
        player:useBoomerang()
    elseif data.item[key] == 3 then
        player:useBomb()
    elseif data.item[key] == 4 then
        player:useBow()
    end
end
