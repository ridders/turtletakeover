-- Iterate through the turtle's inventory
for slot = 1, 16 do
    local item = turtle.getItemDetail(slot)  -- Get details of the item in the current slot

    -- Check if the slot is not empty
    if item then
        print("Slot " .. slot .. ": " .. item.name)  -- Print the name of the item
    end
end
