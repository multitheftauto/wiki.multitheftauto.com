local function ReBan(player)
   if (reloadBans()) then
      outputChatBox("Bans has been reloaded successfully.",player)
   else
      outputChatBox("Failed to Reload Bans.",player)
   end
end
addCommandHandler("reloadban",ReBan)