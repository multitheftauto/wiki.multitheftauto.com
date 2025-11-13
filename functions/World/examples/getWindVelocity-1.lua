function commandGetWindVelocity(player, command)
   local vx, vy, vz = getWindVelocity()
   if (vx) then
       outputChatBox("Wind Velocity X:"..vx.." Y:"..vy.." Z:"..vz, player, 255, 255, 0)
   else
       outputChatBox("Wind velocity is default.", player, 255, 255, 0)
   end
end
addCommandHandler("getwindvelocity", commandGetWindVelocity)