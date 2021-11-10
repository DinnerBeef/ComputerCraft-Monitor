local args, args2 = ...
local alarmType = args
local alarmTimer = args2

if alarmTimer == nil then
    alarmTimer = 1
end

local speakers = { peripheral.find("speaker") }

function playSound (sound, volume, pitch, duration)
    for i = 1, duration do
        for _, speaker in ipairs(speakers) do
            speaker.playSound(sound, volume, pitch)
        end
        sleep(1)
        duration = duration - 1
    end
end

if (alarmType == "CodeBlack") then
    playSound("immersiveengineering:dire_switch", 0.5, 1.0, alarmTimer)
end

if (alarmType == "CodeRed") then
    playSound("minecraft:entity.wither.death", 1.0, 2.0, alarmTimer)
end
