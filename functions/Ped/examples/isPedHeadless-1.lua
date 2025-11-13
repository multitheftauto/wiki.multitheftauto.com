function checkZombie(commandName)
   local player = getLocalPlayer()
   -- check whether the player is headless (a zombie)
   local message = isPedHeadless(player) and "Yes, you are a zombie!" or "No, you aren't a zombie yet!"
   outputChatBox(message)
end

addCommandHandler("zombie", checkZombie)