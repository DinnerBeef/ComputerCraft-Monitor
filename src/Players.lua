-- Player Detector
local player = peripheral.find("playerDetector")
-- Chat Box
local chat = peripheral.find("chatBox")
-- AR Controller
local ar = peripheral.find("arController")
--  Geo Scanner
local env = peripheral.find("geoScanner")

local chatName = "J.A.R.V.I.S."
local welcomeON = true
local welcome = "Welcome To The Base"
local leaveON = true
local leave = "Thanks For Visiting Come Again Soon"
local range = 10
local baseStartX = 5
local baseStartY = 5
local baseAddY = 10
local sleepTime = 1

local ally = "ally"
local enemy = "enemy"

local stats = {}
stats["DinnerBeef"] = enemy
stats["DinnerPoke101"] = enemy

local allyColor = 0x09F37E
local neutralColor = 0x0F42EC
local enemyColor = 0xF30909

local near = {}

function getAllPlayers(dist)
    local players = player.getPlayersInRange(dist)
    return players
end

function basicARView()
    startX = baseStartX
    startY = baseStartY
    addY = baseAddY
    ar.clear()
    ar.drawString("Players", startX, startY, 0xF36F38)
end

function drawPlayer(user, x, y)
    for table, stat in pairs(stats) do
        if (table == user) then
            if (stat == "ally") then
                ar.drawString(user, x, y, allyColor)
            elseif (stat == "enemy") then
                ar.drawString(user, x, y, enemyColor)
                shell.run("Alarm.lua CodeRed 10")
            else
                ar.drawString(user, x, y, neutralColor)
            end
        end
    end
end

function showPlayers()
    local allPlayers = getAllPlayers(range)
    for table, user in pairs(allPlayers) do
        if player.isPlayerInRange(range, user) then
            if (near[user] == nil) then
                startY = startY + addY
                drawPlayer(user,startX,startY)
                if (welcomeON == true) then
                    chat.sendMessageToPlayer(welcome, user, chatName)
                end
                near[user] = user
            end
        end
        table = table
    end
    for table, user in pairs(near) do
        if player.isPlayerInRange(range, user) then
        else
            if (near[user] == nil) then
            else
                if (leaveON == true) then
                    chat.sendMessageToPlayer(leave, user, chatName)
                end
                near[user] = nil
                basicARView()
                for k, _ in pairs(near) do
                    near[k] = nil
                end
            end
        end
        table = table
    end
end

basicARView()

while true do
    showPlayers()
    sleep(sleepTime)
end