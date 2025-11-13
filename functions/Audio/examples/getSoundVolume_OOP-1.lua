function wasted (killer, weapon, bodypart) 
	local sound = Sound("sounds/wasted.mp3") --Play wasted.mp3 from the sounds folder
	outputChatBox("Wasted Sound volume: "..sound.volume) --outputs to the client the volume of the sound
end
addEventHandler("onClientPlayerWasted", localPlayer, wasted) --add the event handler