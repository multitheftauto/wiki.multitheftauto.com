function playMySound()
    playSound("sound.mp3") -- play the sound used for onClientSoundBeat
    addEventHandler("onClientSoundBeat", getRootElement(), changeVehicleColorOnSoundBeat)
end
addEventHandler("onClientResourceStart", getRootElement(), playMySound)

function changeVehicleColorOnSoundBeat()
    if getPedOccupiedVehicle(localPlayer) then -- if the player is inside a vehicle
    setVehicleColor( getPedOccupiedVehicle(localPlayer), math.random(0,255), math.random(0,255), math.random(0,255) ) -- apply the color to the vehicle
    outputChatBox("The color of your vehicle was changed.") 
    else 
    outputChatBox("Could not change the vehicle color, the localPlayer is not inside a vehicle.") 
    return end;
end