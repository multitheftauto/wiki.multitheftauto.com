addCommandHandler("check",function(_,_type)
	if isAmbientSoundEnabled(_type) then
		outputChatBox(_type.." is enabled!",0,255,0)
	else
		outputChatBox(_type.." is disabled!",255,0,0)
	end
end)