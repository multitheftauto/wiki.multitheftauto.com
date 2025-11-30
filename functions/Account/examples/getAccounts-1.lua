function printAmountOfAccounts(thePlayer)
    local accountTable = getAccounts() -- return the table over accounts
    if #accountTable == 0 then -- if the table is empty
        outputChatBox("There are no accounts. :(", thePlayer)
    else -- table isn't empty
        outputChatBox("There are " .. #accountTable .." accounts in this server!", thePlayer)
    end
end
addCommandHandler("accountcount", printAmountOfAccounts) -- add a command handler for command 'accountcount'
