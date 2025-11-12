function checkTrainChainEngine()
   if isPedInVehicle(localPlayer) then
      local train = getPedOccupiedVehicle(localPlayer)
      if getVehicleType(train) == "Train" then
	 outputChatBox("Your train " .. (isTrainChainEngine(train) and "is" or "isn't") .. " a chain engine.", 255, 128, 0)
      else
	 outputChatBox("You need to be in a train to use this command.", 255, 0, 0)
      end
   end
end
addCommandHandler("isthistrainachainengine", checkTrainChainEngine)