-- Geo Scanner
local scanner = peripheral.find("geoScanner")

function getOres ()
    local ores = scanner.chunkAnalyze()
    return ores
end

function getOre(ore)
    local ores = getOres()
    for oreName, amount in pairs(ores) do
        if oreName == ore then
            return amount
        end
    end
    return 0
end

function printOres()
    local file = fs.open("rom/files/ores", "w")
    local ores = scanner.chunkAnalyze()
    for ore, amount in pairs(ores) do
        file.writeLine(ore .. ": " .. amount)
        print(ore .. ": " .. amount)
    end
    file.close()
end

printOres()