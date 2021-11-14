local manager = peripheral.find("inventoryManager")


function removeItemsMining()
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:stone")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:diorite")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:andesite")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:granite")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:dirt")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:gravel")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:cobblestone")
    sleep(1)
end

while true do
    removeItemsMining()
end