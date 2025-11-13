function createTrain(source)
	local myTrain = createVehicle(537,1995,-1949,13)  -- Create the train
	setTrainDirection(myTrain, true) -- Make the train drive clockwise
        setTrainSpeed(myTrain, 1) -- Speed up
end
addCommandHandler("mytrain", createTrain)