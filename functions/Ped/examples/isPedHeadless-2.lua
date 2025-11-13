function checkZombie(playerSource, commandName, playerTargetNick)
   local playerTarget = getPlayerFromName(playerTargetNick)
   if (not playerTarget) then return outputChatBox("Player not online!", playerSource, 255, 0, 0) end

   -- check whether the playerTarget is headless (a zombie)
   local message = isPedHeadless(playerTarget) and "This Player is a zombie!" or "This player is not a zombie!"
   outputChatBox(message, playerSource)
end

addCommandHandler("zombie", checkZombie)