local function listBans(plr)
    local bansList = Ban.getList() -- Return a table of all the bans.
    
    for banID, ban in ipairs(banList) do -- For every ban do the following...
        local nick = ban.nick -- Get the IP of the ban
        local timetounban = ban.unbanTime -- get the time to wait of the banned player
        
        if (nick) then
            plr:outputChat("Ban #" .. banID .. ": " .. nick.." || Time to unban: "..timetounban , 255, 0, 0) -- Output the baninfo
        end
    end
end
addCommandHandler("bans", listBans) -- Add "/bans" as the trigger for the function.