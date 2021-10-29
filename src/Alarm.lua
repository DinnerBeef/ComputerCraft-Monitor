local args, args2 = {...}
alarmType = args
alarmTime = args2

local speakers = { peripheral.find("speaker") }

function playSound (sound)
    for i, speaker in ipairs(speakers) do
        speaker.playSound(sound)
    end
end

if (alarmType == "CodeRed") then
    playSound("immersiveengineering:dire_switch")
end