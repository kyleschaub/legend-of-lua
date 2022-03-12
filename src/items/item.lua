function useItem()
    if data.item == 1 then -- boomerang
        player:useBoomerang()
    elseif data.item == 2 then -- bomb
        player:useBomb()
    end
end
