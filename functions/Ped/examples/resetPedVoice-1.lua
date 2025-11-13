addEventHandler("onClientResourceStart", resourceRoot, function()
	setPedVoice(localPlayer, "PED_TYPE_GANG", "VOICE_GNG_MACCER")
	setTimer(resetPedVoice, 5000, 1, localPlayer)
end)