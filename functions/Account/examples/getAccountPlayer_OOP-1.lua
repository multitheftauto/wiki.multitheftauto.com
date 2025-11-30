local function isAccountUserAlive(theAccount)
    local thePlayer = theAccount.player -- get the client attached to the account
    if (thePlayer.type == "player") then -- see if it really is a player (rather than a console admin for example)
        return not thePlayer.dead -- if the player's health is greater than 0 
    end
    return false
end