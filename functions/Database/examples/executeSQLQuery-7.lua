function listPlayersWithMoreMoneyThan(thePlayer, command, amount)
    local players = executeSQLQuery("SELECT id, name FROM players WHERE money > ?", tonumber(amount))
    outputConsole("Players with more money than " .. amount .. ":", thePlayer)
    for i, playerdata in ipairs(players) do
        outputConsole(playerdata.id .. ": " .. playerdata.name, thePlayer)
    end
end

addCommandHandler("richplayers", listPlayersWithMoreMoneyThan)