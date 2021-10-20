-- Player Detector
local player = peripheral.find("playerDetector")
-- Chat Box
local chat = peripheral.find("chatBox")
-- AR Controller
local ar = peripheral.find("arController")

local name = "J.A.R.V.I.S."
local welcomeON = true
local welcome = "Welcome To The Base"
local leaveON = true
local leave = "Thanks For Visiting Come Again Soon"
local range = 10
local baseStartX = 5
local baseStartY = 5
local baseAddY = 10

local allys = {}
local enemies = {}

local allyColor = 0xF36F38
local neutralColor = 0xF36F38
local enemyColor = 0xF36F38

local near = {}

function getAllPlayers(range)
    local players = player.getPlayersInRange(range)
    return players
end

function basicARView()
    startX = baseStartX
    startY = baseStartY
    addY = baseAddY
    ar.clear()
    ar.drawString("Players", startX, startY, 0xF36F38)
end

function showPlayers()
    local allPlayers = getAllPlayers(range)
    for table, user in pairs(allPlayers) do
        if player.isPlayerInRange(range, user) then
            if (near[user] == nil) then
                startY = startY + addY
                ar.drawString(user, startX, startY, allyColor)
                if (welcomeON == true) then
                    chat.sendMessageToPlayer(welcome, user, name)
                end
                near[user] = user
            end
        end
    end
    for table, user in pairs(near) do
        if player.isPlayerInRange(range, user) then else
            if (near[user] == nil) then
            else
                if (leaveON == true) then
                    chat.sendMessageToPlayer(leave, user, name)
                end
                near[user] = nil
                basicARView()
                for k, v in pairs(near) do
                    near[k] = nil
                end
            end
        end
    end
end

basicARView()

while true do
    showPlayers()
    sleep(5)
end