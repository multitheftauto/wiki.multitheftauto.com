function printAllData ( thePlayer )
    local playerAccount = thePlayer.account -- get his account
    if ( playerAccount ) then -- if we got the account then
        local data = playerAccount.data -- get data
        count = 0
        for _ in pairs(data) do count = count + 1 end -- get the count
        thePlayer:outputChat ( "table holds " .. count .. " entries") -- output number of rows
        if ( data ) then
            for k,v in pairs ( data ) do
                thePlayer:outputChat(k..": "..v) -- print the key and value of each entry of data
            end
        end
    end
end
addCommandHandler( "getall", printAllData ) -- add a command handler for command 'getall'