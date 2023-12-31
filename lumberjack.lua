-- Function to refuel the turtle if fuel is low
local function refuelIfNeeded()
    if turtle.getFuelLevel() < 500 then
        print("Low on fuel. Refueling...")
        turtle.select(1)  -- Assuming fuel is in the first slot
        turtle.refuel()
    end
end

-- Function to plant saplings in a row
local function plantSaplings()
    for i = 1, 16 do
        turtle.select(i)
        if turtle.getItemCount(i) > 0 then
            turtle.place()
        end
    end
end

-- Function to check for tree growth and chop it down
local function checkAndChopTree()
    if turtle.detect() then
        print("Tree detected. Chopping down...")
        turtle.dig()
        while turtle.detectUp() do
            turtle.digUp()
        end
        print("Tree chopped down.")
    end
end

-- Main loop
while true do
    -- Plant saplings
    plantSaplings()

    -- Step back after planting
    turtle.back()

    -- Check for tree growth and chop down
    checkAndChopTree()

    -- Refuel if needed
    refuelIfNeeded()

    -- Wait for tree to grow (adjust sleep duration based on tree growth time)
    print("Waiting for trees to grow...")
    os.sleep(300)  -- Sleep for 5 minutes (adjust as needed)
end
