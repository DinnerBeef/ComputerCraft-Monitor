-- Geo Scanner
local scanner = peripheral.find("geoScanner")

function getOres ()
    local ores = scanner.chunkAnalyze()
    return ores
end

function getOre(ore)
    local ores = getOres()
    for i = 1, #ores do
        if ores[i].name == ore then
            return ores[i].amount
        end
    end
    return 0
end

function printOres()
    local ores = getOres()
    for i = 1, #ores do
        print(ores[i].name .. ": " .. ores[i].amount)
    end
end

printOres()