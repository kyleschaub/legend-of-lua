function useItem(key, released)
    if data.item[key] == 1 and released ~= true then
        player:swingSword()
    elseif data.item[key] == 2 and released ~= true then
        player:useBoomerang()
    elseif data.item[key] == 3 and released ~= true then
        player:useBomb()
    elseif data.item[key] == 4 then
        --player:useBow() useBow is handled from player
    elseif data.item[key] == 5 and released ~= true then
        player:useHookshot()
    elseif data.item[key] == 11 and released ~= true then
        player:useFireball()
    elseif data.item[key] == 12 and released ~= true then
        player:useHookshot()
    end
end
