local args, args2 = ...
alarmType = args
alarmTime = args2

local speakers = { peripheral.find("speaker") }

function playSound (sound, volume, pitch)
    for _, speaker in ipairs(speakers) do
        speaker.playSound(sound, volume, pitch)
    end
end

if (alarmType == "CodeBlack") then
    playSound("immersiveengineering:dire_switch",0.5,1.0)
end

if (alarmType == "CodeRed") then
    playSound("minecraft:entity.wither.death", 1.0, 2.0)
end
