function changeCanBeKnockedOff()
    local canBeKnocked = canPedBeKnockedOffBike(localPlayer)
    local knockedText = canBeKnocked and "Now you can't be knocked off your bike." or "Now you can be knocked off your bike."

    setPedCanBeKnockedOffBike(localPlayer, not canBeKnocked)
    outputChatBox(knockedText)
end
addCommandHandler("knock", changeCanBeKnockedOff)