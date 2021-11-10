-- Player Detector
local player = peripheral.find("playerDetector")
-- Chat Box
local chat = peripheral.find("chatBox")
-- AR Controller
local ar = peripheral.find("arController")

local chatName = "J.A.R.V.I.S." -- Name of the chat box that prints messages
local welcomeON = true -- Enable/Disable welcome message
local welcome = "Welcome To The Base" -- Welcome message
local leaveON = true -- Enable/Disable leave message
local leave = "Thanks For Visiting Come Again Soon" -- Leave message
local range = 10 -- Range of the player detector
local baseStartX = 5 -- AR start position X
local baseStartY = 5 -- AR start position Y
local baseAddY = 10 -- Space between players names
local sleepTime = 1  -- Sleep time between each player detection

local ally = "ally"  -- Sets the name of the ally sting
local enemy = "enemy" -- Sets the name of the enemy string

local stats = {} -- Creates a table for the stats
-- Table for players
stats["DinnerBeef"] = ally
stats["DinnerPoke101"] = enemy

local allyColor = 0x09F37E  -- Sets the color of the ally in the AR
local neutralColor = 0x0F42EC -- Sets the color of the neutral in the AR
local enemyColor = 0xF30909  -- Sets the color of the enemy in the AR

local near = {}

function getAllPlayers(dist)
    -- Gets all players in range
    local players = player.getPlayersInRange(dist)
    return players
end

function basicARView()
    -- Sets the basic AR view
    startX = baseStartX
    startY = baseStartY
    addY = baseAddY
    ar.clear()
    ar.drawString("Players", startX, startY, 0xF36F38)
end

function drawPlayer(user, x, y)
    -- Draws the player in the AR, Runs every time a player enters the range
    for table, stat in pairs(stats) do
        if (table == user) then
            if (stat == "ally") then
                ar.drawString(user, x, y, allyColor)
            elseif (stat == "enemy") then
                ar.drawString(user, x, y, enemyColor)
                shell.run("Alarm.lua CodeRed 1")
            else
                ar.drawString(user, x, y, neutralColor)
            end
        end
    end
end

local stateRed = false

function playSoundRepeat(type)
    -- Plays a sound repeat
    if (type == "CodeRed") then
        stateRed = true
        while (stateRed == true) do
            shell.run("Alarm.lua CodeRed 1")
        end
    end
end

function showPlayers()
    local allPlayers = getAllPlayers(range) -- Gets all players in range
    for table, user in pairs(allPlayers) do -- runs for each player in range
        if player.isPlayerInRange(range, user) then
            if (near[user] == nil) then -- Sees if the user is all ready in range
                startY = startY + addY -- Adds the space between players
                drawPlayer(user, startX, startY) -- Draws the player on the AR View
                if (welcomeON == true) then
                    -- Send a welcome message if enabled
                    chat.sendMessageToPlayer(welcome, user, chatName)
                end
                near[user] = user -- Adds the user to the near table. Users need to be added so code knows who is in range
            end
        end
        table = table
    end
    for table, user in pairs(near) do -- runs for all players in the near/"in range" table
        if player.isPlayerInRange(range, user) then -- Test if player is still in range
        --    playSoundRepeat("CodeRed") -- Plays the sound repeat un the player leaves the range
        else -- runs when the player is not in range anymore
            if (near[user] == nil) then
            else -- runs when the player is not in range anymore
                if (leaveON == true) then -- Send a leave message if enabled
                    chat.sendMessageToPlayer(leave, user, chatName)
                end
                for table, stat in pairs(stats) do -- Test for anyother enemy in range to see if alarm needs to stay on
                    if (stat == "enemy") then
                        break
                    else
                        stateRed = false
                    end
                end
            end
            near[user] = nil -- Removes the user from the near table so they are not in range for the code
            basicARView() -- clears the table to remove the players
            for k, _ in pairs(near) do
                startY = startY + addY -- Adds the space between players
                drawPlayer(k, startX, startY) -- Draws the player on the AR View
            end
        end
    end
    table = table
end

basicARView()

while true do
    showPlayers()
    sleep(sleepTime)
end