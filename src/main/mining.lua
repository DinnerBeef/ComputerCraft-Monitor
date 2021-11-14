local manager = peripheral.find("inventoryManager")


function removeItemsMining()
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:stone")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:diorite")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:andesite")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:granite")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:dirt")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:gravel")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:cobblestone")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:coal")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:redstone")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:lapis")
    manager.removeItemFromPlayer("UP", 64 , -1, "minecraft:diamond")
    manager.removeItemFromPlayer("UP", 64 , -1, "emendatusenigmatica:ruby_gem")
    manager.removeItemFromPlayer("UP", 64 , -1, "emendatusenigmatica:sapphire_gem")
    manager.removeItemFromPlayer("UP", 64 , -1, "emendatusenigmatica:copper_ingot")
    manager.removeItemFromPlayer("UP", 64 , -1, "emendatusenigmatica:tin_ingot")
    sleep(1)
end

while true do
    removeItemsMining()
end