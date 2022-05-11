local readers = { peripheral.find("blockReader") }

function maxZaps ()
    zaps = 0
    for _, reader in ipairs(readers) do
        data = reader.getBlockData()
        if (data["id"] == "ftbic:lv_battery_box") then
            zaps = zaps + 40000
        elseif (data["id"] == "ftbic:mv_battery_box") then
            zaps = zaps + 400000
        elseif (data["id"] == "ftbic:hv_battery_box") then
            zaps = zaps + 4000000
        elseif (data["id"] == "ftbic:ev_battery_box") then
            zaps = zaps + 40000000
        end
    end
    return zaps
end

function zaps()
    power = 0
    for _, reader in ipairs(readers) do
        data = reader.getBlockData()
        if (data["Energy"] ~= nil ) then
            power = power + data["Energy"]
        end
    end
    return power
end

function percentFull()
    return zaps() / maxZaps()
end
