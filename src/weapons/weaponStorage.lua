weaponStorage = {}

function addWeapon(type, id)

    local weapon = {}
    weapon.type = type
    weapon.id = id

    local weaponStats = getWeaponStats(type, id)
    weapon.sprite = weaponStats.sprite
    weapon.name = weaponStats.name

    -- every weapon has a tag, since the index will change
    weapon.tag = math.random()

    -- Equip the weapon if the player does not have anything equipped
    if player.weaponTag == 0 then
        player:equipWeapon(weapon.type, weapon.id, weapon.tag)
    end

    table.insert(weaponStorage, weapon)

end