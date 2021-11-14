local detector = peripheral.find("playerDetector")

function getAllPlayersInRange(range) -- Gets all players in range
    local players = detector.getPlayersInRange(range)
    return players
end

function isPlayerInRange(range, user)
    bool = detector.isPlayerInRange(range, user)
    return bool
end

