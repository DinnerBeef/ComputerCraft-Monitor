local speakers = { peripheral.find("speaker") }

function playSound (sound)
        for _, speaker in ipairs(speakers) do
            speaker.playSound(sound)
        end
end