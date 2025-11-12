function changeCanBeKnockedOff ( command )
	-- lets players be knocked off bikes if it was set to false, true otherwise
	local bCanBeKnockedOff = canPedBeKnockedOffBike(localPlayer)
	setPedCanBeKnockedOffBike(localPlayer, not bCanBeKnockedOff)
	
	-- outputs the respective message
	outputChatBox( ('Now you %s be knocked off your bike.'):format(bCanBeKnockedOff and 'can\'t' or 'can') )
end
addCommandHandler('knock', changeCanBeKnockedOff)