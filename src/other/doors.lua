doors {
    ["1"] = 1, -- ["Door Name"], "Redstone Integrator"
    ["2"] = 2,
    ["3"] = 3
}

function getRedstoneIntegrator(id)
    local integrator = peripheral.wrap(id)
    return integrator
end

while true do
    event, username, message = os.pullEvent("chat") -- Will be fired when someone sends a chat
    newMessage = string.lower(message)
    for name, redstone in ipairs(door) do
        if newMessage == name then
            temp = getRedstoneIntegrator(redstone)
            if temp.getInput() == false then
                temp.setOutput(true)
            else
                temp.setOutput(false)
            end
        end
    end
end

