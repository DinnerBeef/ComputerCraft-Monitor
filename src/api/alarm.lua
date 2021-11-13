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

