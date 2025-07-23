local function isAccountUserAlive ( theAccount )
    local thePlayer = getAccountPlayer ( theAccount )       -- get the client attached to the account
    if ( getElementType ( thePlayer ) == "player" ) then    -- see if it really is a player (rather than a console admin for example)
        return not isPedDead(thePlayer)             -- if the player's health is greater than 0 
    end
    return false
end