setGlitchEnabled("fastmove",true) -- Enable the fastmove glitch at resource start.

function checkIsEnabled(thePlayer,command)
	if (isGlitchEnabled("fastmove")) then -- Check weather fastmove is enabled or not.
		outputChatBox("fastmove is enabled.",thePlayer,255,255,0) -- If so, output that it's enabled.
	else
		outputChatBox("fastmove is not enabled.",thePlayer,255,0,0) -- If not, output that it isn't enabled.
	end
end
addCommandHandler("glitch",checkIsEnabled)