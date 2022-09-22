function useItem(key, released)
    if data.item[key] == 1 and released ~= true then
        player:swingSword()
    elseif data.item[key] == 2 and released ~= true then
        player:useBoomerang()
    elseif data.item[key] == 3 and released ~= true then
        player:useBomb()
    elseif data.item[key] == 4 and player.state ~= 0 then
        player:useBow() -- adds bow to the buffer
    elseif data.item[key] == 5 and released ~= true then
        player:useHookshot()
    elseif data.item[key] == 11 and released ~= true then
        player:useFire()
    elseif data.item[key] == 12 and released ~= true then
        player:useHookshot()
    end
end
