addCommandHandler("jetpack", function(thePlayer)
    if (doesPedHaveJetPack(thePlayer)) then -- If the player have a jetpack already, remove it
        removePedJetPack(thePlayer) -- Remove the jetpack
        return -- And stop the function here
    end

    -- Otherwise, give him one if he has access

    local accName = getAccountName(getPlayerAccount(thePlayer)) -- get his account name
    if (isObjectInACLGroup("user."..accName, aclGetGroup("Admin"))) then -- Does he have access to Admin functions?
        if (not doesPedHaveJetPack(thePlayer)) then -- If the player doesn't have a jetpack give it.
            givePedJetPack(thePlayer)  -- Give the jetpack
        end
    end
end)