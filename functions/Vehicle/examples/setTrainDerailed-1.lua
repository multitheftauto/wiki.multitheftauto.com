function makeTrain(thePlayer)
	myTrain = createVehicle(537,1995,-1949,13)-- This will make a freight train just east of the LS train station
	setTrainDerailable(myTrain, false) -- myTrain can not be derailed now
	outputChatBox("A freight train has been created for you.", thePlayer) -- Just a simple message for the player
end
addCommandHandler("trainmeup", makeTrain)

function derailTrain()
	setTrainDerailed(myTrain, true) -- When the command is used the train becomes derailed
	outputChatBox("Freight train has been derailed!", thePlayer) -- A message to confirm the train was derailed
end
addCommandHandler("derailme", derailTrain)