addCommandHandler("check_sounds",
function()
	if getInteriorSoundsEnabled() then 
		outputChatBox("Interior sounds are enabled!!!",0,255,0)
	else
		outputChatBox("Interior sounds are disabled!!!",255,0,0) 
	end
end)