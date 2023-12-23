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
        -- Select the slot with saplings
        turtle.select(2)  -- Assuming saplings are in the second slot

        -- Plant saplings in a row, 5 blocks apart
        for i = 1, 5 do
            turtle.place()  -- Place sapling from the selected slot
            turtle.forward()
        end

        -- Move back to the starting position
        for i = 1, 5 do
            turtle.back()
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
            turtle.forward()
        end

        print("Waiting before planting again...")
        os.sleep(300)  -- Wait for 5 minutes (adjust as needed)
    end
end

-- Main program
plantAndChop()
