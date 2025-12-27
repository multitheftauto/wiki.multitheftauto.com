function getMyData(thePlayer, command)
    local data = thePlayer:getAllData() -- get all the element data of the player who entered the command
    for k, v in pairs(data) do -- loop through the table that was returned
        outputConsole(k .. ": " .. tostring(v)) -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
    end
end
addCommandHandler("elemdata", getMyData)
