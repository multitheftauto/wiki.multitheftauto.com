function printAllData(thePlayer)
    local playerAccount = getPlayerAccount(thePlayer) -- get his account
    if (playerAccount) then -- if we got the account then
        local data = getAllAccountData(playerAccount) -- get data
        count = 0
        for _ in pairs(data) do count = count + 1 end -- get the count
        outputChatBox("table holds " .. count .. " entries", thePlayer) -- output number of rows
        if (data) then
            for k, v in pairs(data) do
                outputChatBox(k .. ": " .. v, thePlayer) -- print the key and value of each entry of data
            end
        end
    end
end
addCommandHandler("getall", printAllData) -- add a command handler for command 'getall'
