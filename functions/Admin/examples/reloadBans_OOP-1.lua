local function ReBan(player)
   if (Ban.reload()) then
      player:outputChat("Bans has been reloaded successfully.")
   else
      player:outputChat("Failed to Reload Bans.")
   end
end
addCommandHandler("reloadban",ReBan)