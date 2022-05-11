os.loadAPI("api/alarm")
os.loadAPI("api/ar")
os.loadAPI("api/chat")
os.loadAPI("api/detector")
os.loadAPI("api/redstone")
os.loadAPI("util/config")

local chatName = config.chatName
local welcomeON = config.welcomeON
local welcome = config.welcome
local leaveON = config.leaveON
local leave = config.leave
local range = config.range
local baseStartX = config.baseStartX
local baseStartY = config.baseStartY
local baseAddY = config.baseStartY
local sleepTime = config.sleepTime
local stats = config.players

local inRange = {}

function showPlayers()
    local allPlayers = api/detector.getAllPlayers(range)
    for table, user in pairs(allPlayers) do
        if (inRange[user] == nil) then
            -- Sees if the user is all ready in range
            startY = startY + addY -- Adds the space between players
            drawPlayer(user, startX, startY) -- Draws the player on the AR View
            if (welcomeON == true) then
                -- Send a welcome message if enabled
                chat.sendMessageToPlayer(welcome, user, chatName)
            end
            inRange[user] = user -- Adds the user to the inRange table. Users need to be added so code knows who is in range
        end
        table = table
    end
    for table, user in pairs(inRange) do
        -- runs for all players in the inRange/"in range" table
        if player.isPlayerInRange(range, user) then
            -- Test if player is still in range
            --    playSoundRepeat("CodeRed") -- Plays the sound repeat un the player leaves the range
        else
            -- runs when the player is not in range anymore
            if (inRange[user] == nil) then
            else
                -- runs when the player is not in range anymore
                if (leaveON == true) then
                    -- Send a leave message if enabled
                    chat.sendMessageToPlayer(leave, user, chatName)
                end
                for table, stat in pairs(stats) do
                    -- Test for anyother enemy in range to see if alarm needs to stay on
                    if (stat == "enemy") then
                        break
                    else
                    end
                end
            end
            inRange[user] = nil -- Removes the user from the inRange table so they are not in range for the code
            ar.basicARView(baseStartX, baseStartY) -- clears the table to remove the players
            for k, _ in pairs(inRange) do
                startY = startY + addY -- Adds the space between players
                drawPlayer(k, startX, startY) -- Draws the player on the AR View
            end
        end
    end
    table = table
end

ar.basicARView(baseStartX, baseStartY)

while true do
    showPlayers()
    sleep(sleepTime)
end