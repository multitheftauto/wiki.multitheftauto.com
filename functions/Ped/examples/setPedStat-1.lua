function changeBodyStrength(thePlayer, commandName)
    -- Output whether the setPlayerStat was successful in changing the BODY_MUSCLE STAT     
    if setPedStat(thePlayer, 23, 1000) then
    	outputChatBox("Your player looks really muscular")
    else
        outputChatBox("Failed to make your player look muscular.")
    end
end
addCommandHandler("beefcake", changeBodyStrength)