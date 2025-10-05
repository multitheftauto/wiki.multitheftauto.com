function wasted (killer, weapon, bodypart) 
	local sound = Sound("sounds/wasted.mp3") -- Play wasted.mp3 from the sounds folder
	sound.volume = 0.5 -- Set the sound volume to 50%
end
addEventHandler("onClientPlayerWasted", localPlayer, wasted) -- Add the event handler