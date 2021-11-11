local args, args2 = ...

local inputColor = args
local inputState = args2

local redstone = {}

local NORTH = "north"
local SOUTH = "south"
local WEST = "west"
local EAST = "east"
local UP = "up"
local DOWN = "down"

-- Set the number to the network number
redstone["While"] = 9, EAST
redstone["Orange"] = 10, EAST
redstone["Magenta"] = 11, EAST
redstone["LightBlue"] = 12, EAST
redstone["Yellow"] = 13, EAST
redstone["Lime"] = 14, EAST
redstone["Pink"] = 15, EAST
redstone["Gray"] = 16, EAST
redstone["LightGray"] = 8, WEST
redstone["Cyan"] = 9, WEST
redstone["Purple"] = 10, WEST
redstone["Blue"] = 11, WEST
redstone["Brown"] = 12, WEST
redstone["Green"] = 13, WEST
redstone["Red"] = 14, WEST
redstone["Black"] = 15, WEST

function redstoner(input, state)
    for color1, side, peripheralN in ipairs(redstone) do
        if (color1 == input) then
            redstoneblock = peripheral.warp(redstoneIntegrator_ .. peripheralN)
            if (state == "on") then
                redstoneblock.setOutput(side, state)
            end
        end
    end
end

redstoner(inputColor, inputState)
