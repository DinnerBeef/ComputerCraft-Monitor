chatName = "J.A.R.V.I.S." -- Name of the chat box that prints messages

welcome = "Welcome To The Base" -- Welcome message
leave = "Thanks For Visiting Come Again Soon" -- Leave message

welcomeON = false  -- Enable/Disable welcome message
leaveON = false -- Enable/Disable leave message

range = 10 -- Range of the player detector

baseStartX = 5 -- AR start position X
baseStartY = 5 -- AR start position Y
baseAddY = 10 -- Space between players names

sleepTime = 1  -- Sleep time between each player detection

allyColor = 0x09F37E  -- Sets the color of the ally in the AR
neutralColor = 0x0F42EC -- Sets the color of the neutral in the AR
enemyColor = 0xF30909  -- Sets the color of the enemy in the AR

function players() -- List all players in this function
    stats = {}
    stats["DinnerBeef"] = "ally"
    stats["UnRealDinnerbone"] = "ally"
    stats["manmaed"] = "enemy"
    return stats
end