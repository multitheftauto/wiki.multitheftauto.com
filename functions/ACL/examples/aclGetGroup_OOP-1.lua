local function giveAdminRights(playerSource, commandName, accountName) -- add the function giveAdminRights and specify its arguments
    if (accountName) then -- if there was an accountName entered then
        local adminGroup = ACLGroup.get("Admin")
        if (adminGroup) then
            adminGroup:addObject("user." .. accountName)
            playerSource:outputChat("Account '" .. accountName .."' succesfully added to the admin group") -- output a notification to the player who entered the command that the acocunt was successfully added
        end
    else -- else output an error message and the correct syntax of the command to the player who entered it
        playerSource:outputChat("No account name specified.")
        playerSource:outputChat("Correct syntax: /giveAccountAdminRights [accountName]")
    end
end
addCommandHandler("giveAccountAdminRights", giveAdminRights) -- add a command "giveAccountAdminRights" and attch the function "giveAdminRights" to it 
