function digRow()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
end

while true do
    turtle.dig()
    turtle.forward()
    for i = 1, 3 do
        digRow()
        if (i < 3) then
            turtle.digUp()
            turtle.up()
        end
    end
    turtle.dig()
    turtle.down()
    turtle.down()
end

