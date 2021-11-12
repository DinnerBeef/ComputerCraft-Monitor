local manger = peripheral.find("inventoryManager")


function removeItemsMining()
    manger.removeItemFromPlayer("north", 64 , -1, "minecraft:stone")
    manger.removeItemFromPlayer("north", 64 , -1, "minecraft:diorite")
    manger.removeItemFromPlayer("north", 64 , -1, "minecraft:andesite")
    manger.removeItemFromPlayer("north", 64 , -1, "minecraft:granite")
    sleep(1)
end

while true do
    removeItemsMining()
end