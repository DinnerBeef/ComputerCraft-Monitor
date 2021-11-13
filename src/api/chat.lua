-- Chat Box API
local box = peripheral.find("chatBox")

function sendMessage(message, prefix)
    box.sendMessage(message, prefix)
end

function sendMessageToPlayer(message, player, prefix)
    box.sendMessageToPlayer(message, player, prefix)
end

function sendMessageToPlayers(message, players, prefix)
    for _, player in pairs(players) do
        box.sendMessageToPlayers(message, player, prefix)
    end
end
