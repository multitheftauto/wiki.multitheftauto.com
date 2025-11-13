function showPlayerMoney(thePlayer, command, playerName)
    local result = executeSQLQuery("SELECT money FROM players WHERE name=?", playerName)
    if(#result == 0) then
        outputConsole("No player named " .. playerName .. " is registered.", thePlayer)
    else
        outputConsole("Money amount of player " .. playerName .. " is " .. result[1].money, thePlayer)
    end
end
addCommandHandler("playermoney", showPlayerMoney)