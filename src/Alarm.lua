local args, args2, args3, args4 = ...
local alarmType = args
local alarmTimer = args2
local alarmName = args3
local alarmState = args4

if alarmTimer == nil then
    alarmTimer = 1
end

local speakers = { peripheral.find("speaker") }

function playSoundTime (sound, volume, pitch, duration)
    for i = 1, duration do
        for _, speaker in ipairs(speakers) do

            speaker.playSound(sound, volume, pitch)
        end
        sleep(1)
        duration = duration - 1
    end
end

function playSoundRepeat (sound, volume, pitch)
    while true do
        for _, speaker in ipairs(speakers) do
            speaker.playSound(sound, volume, pitch)
        end
        sleep(1)
    end
end

if (alarmType == "CodeBlack") then
    playSoundTime("immersiveengineering:dire_switch", 0.5, 1.0, alarmTimer)
end

if (alarmType == "CodeRed") then
    playSoundTime("minecraft:entity.wither.death", 1.0, 2.0, alarmTimer)
end

