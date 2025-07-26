local function listBans(playerSource)
    local banList = Ban.getList() -- Return a table of all the bans.
    for banID, ban in ipairs(banList) do -- For every ban do the following...	
        local nick = ban.nick -- Get the IP of the ban
        if (nick) then
            playerSource:outputChat("Ban #" ..banID..": "..nick , 255, 0, 0, true) -- Output the ban.
        end
    end
end
addCommandHandler("bans", listBans) -- Add "/bans" as the trigger for the function.