function makeTrain(source)
	local myTrain = createVehicle(537,1995,-1949,13)  -- This will make a freight train just east of the LS train station
	setTrainDerailable(myTrain, false) -- myTrain can not be derailed now
	outputChatBox("A freight train has been created for you.", source, 255, 255, 0) -- Just a simple message for the player
        warpPedIntoVehicle(source, myTrain) -- This will warp you to inside the train
        setTrainSpeed(myTrain, 1) -- Set the train speed to 1 - 100mph, 160kmh
end
addCommandHandler("trainmeup", makeTrain)