addCommandHandler("flanger", function(cmd, enabled)
	if isElement(waterSplashes) then
		setSoundEffectEnabled(waterSplashes, cmd, enabled)
	else
		waterSplashes = playSound("splashes.mp3", true)
		setSoundEffectEnabled(waterSplashes, cmd, enabled)
	end
end, true) --set it case sensitive as we are going to get the command name and use it in the setSoundEffectEnabled