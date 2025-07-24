addCommandHandler("jetpack", function(thePlayer)
    if (thePlayer.jetpack) then -- If the player have a jetpack already, remove it
        thePlayer.jetpack = false -- Remove the jetpack
        return -- And stop the function here
    end

    -- Otherwise, give him one if he has access

    local accName = thePlayer.account.name -- get his account name
    if (ACLGroup.get("Admin"):doesContainObject("user."..accName)) then -- Does he have access to Admin functions?
        if (not thePlayer.jetpack) then -- If the player doesn't have a jetpack give it.
            thePlayer.jetpack = true -- Give the jetpack
        end
    end
end)