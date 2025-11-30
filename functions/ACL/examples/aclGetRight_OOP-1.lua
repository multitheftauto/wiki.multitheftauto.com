-- theACL examples: Admin, Default, Moderator
-- theRight examples: command.debugscript, function.banPlayer
local function aclRightCheck(player, command, theACL, theRight)
    if (theACL and theRight) then -- Make sure atleast two arguments were entered.
        local theACL = ACL.get(theACL) -- If theACL exists then convert it into an ACL pointer from a string.
        if (theACL) then -- If the ACL was found.
            local theReturn = theACL:getRight(theRight) -- Will return true if it was found in the ACL.
            player:outputChat("The ACL right was found and returned: " ..tostring(theReturn), 0, 255, 0)
        else
            player:outputChat("The ACL you entered was not found to exist in the ACL file.", 255, 0, 0) -- When the ACL was not found.
        end
    else
        player:outputChat("You need to enter an ACL, and a right name.", 255, 0, 0) -- When 2 arguements weren't entered.
    end
end
addCommandHandler("aclgetright", aclRightCheck) -- When a player does the aclgetright command it calls aclRightCheck function above.
-- Example of use: /aclgetright Admin command.debugscript (this should return true)
-- Example of use: /aclgetright Default command.debugscript (this should return false)
