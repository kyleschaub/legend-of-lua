function getWeaponStats(type, id)

    local weapon = {}

    if type == "sword" then

        if id == 0 then
            weapon.name = "Wooden Sword"
            weapon.sprite = sprites.weapons.wooden_sword
            weapon.power = 1
        elseif id == 1 then
            weapon.name = "White Sword"
            weapon.sprite = sprites.weapons.white_sword
            weapon.power = 2
        elseif id == 2 then
            weapon.name = "Magic Rod"
            weapon.sprite = sprites.weapons.magic_rod
            weapon.power = 0
        end

    end

    return weapon

end