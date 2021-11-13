local manager = peripheral.find("inventoryManager")


function removeItemsMining()
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:stone")
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:diorite")
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:andesite")
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:granite")
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:dirt")
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:gravel")
    manager.removeItemFromPlayer("north", 64 , -1, "minecraft:cobblestone")
    sleep(1)
end

while true do
    removeItemsMining()
end