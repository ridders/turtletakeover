-- Function to check fuel level and refuel if needed
function checkFuel()
    if turtle.getFuelLevel() < 20 then
        print("Low on fuel. Refueling...")
        turtle.select(1)  -- Assuming fuel is in the first slot
        turtle.refuel()
    end
end

-- Function to plant saplings and chop down trees
function plantAndChop()
    while true do
        -- Plant saplings in a row, 5 blocks apart
        for i = 1, 5 do
            turtle.place()  -- Assuming saplings are in the turtle's inventory
            turtle.forward()
        end

        -- Check for tree growth
        while turtle.detect() do
            print("Tree detected. Chopping...")
            turtle.dig()  -- Assuming the turtle has an axe in its inventory
            turtle.up()
            checkFuel()
        end

        -- Move back, wait, and repeat
        for i = 1, 5 do
            turtle.back()
        end
        print("Waiting before planting again...")
        os.sleep(300)  -- Wait for 5 minutes (adjust as needed)
    end
end

-- Main program
plantAndChop()
