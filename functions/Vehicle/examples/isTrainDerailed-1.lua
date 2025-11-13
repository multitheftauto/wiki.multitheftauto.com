function checkDerailed(thePlayer)
    local theTrain = getPedOccupiedVehicle(thePlayer)
    if ( theTrain and getVehicleType(theTrain) == "Train" ) then --is the player in a vehicle and is it a train?
        if ( isTrainDerailed(theTrain) ) then --is the train derailed?
            outputChatBox("Your train is derailed", thePlayer, 255, 255, 0) --outputs a message
        else
            outputChatBox("Your train is not derailed", thePlayer, 0, 255, 0) --outputs a message
        end
    end
end
addCommandHandler("checkTrain", checkDerailed) --adds the command handler