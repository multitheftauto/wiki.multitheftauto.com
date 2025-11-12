addCommandHandler("getangularvelocity", 
	function(sourcePlayer, commandName)
		local aX, aY, aZ = getElementAngularVelocity(sourcePlayer)

		outputChatBox("Your current angular velocity is: X: " .. aX .." Y: " .. aY .." Z: " .. aZz, sourcePlayer)
	end
)