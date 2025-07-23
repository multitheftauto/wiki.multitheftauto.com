function printAmountOfAccounts ( thePlayer )
    local accountTable = Account.getAll() -- return the table over accounts
    if #accountTable == 0 then -- if the table is empty
        thePlayer:outputChat( "There are no accounts. :(" )
    else -- table isn't empty
        thePlayer:outputChat( "There are " .. #accountTable .. " accounts in this server!" )
    end
end
addCommandHandler( "accountcount", printAmountOfAccounts ) -- add a command handler for command 'accountcount'