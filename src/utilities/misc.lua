function miscUpdate(dt)
    if globalStun > 0 then
        globalStun = globalStun - dt
    end

    if globalStun < 0 then
        globalStun = 0
    end
end
