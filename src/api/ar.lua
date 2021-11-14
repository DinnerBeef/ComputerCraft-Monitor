local controller = peripheral.find("arController")

local allyColor = util/config.allyColor
local neutralColor = util/config.neutralColor
local enemyColor = util/config.enemyColor

function basicARView(startX, startY)
    -- Sets the basic AR view
    controller.clear()
    controller.drawString("Players", startX, startY, 0xF36F38)
end

function drawPlayer(user, x, y)
    for table, stat in pairs(stats) do
        if (table == user) then
            if (stat == "ally") then
                controller.drawString(user, x, y, allyColor)
            elseif (stat == "enemy") then
                controller.drawString(user, x, y, enemyColor)
            end
            if (table == nil) then
                controller.drawString(user, x, y, neutralColor)
            end
        end
    end
end