addCommandHandler ( "getvoice",
	function ()
		local voicetype, voicename = getPedVoice(localPlayer)
		outputChatBox ( "Your ped voice type is " .. tostring(voicetype) .. " and voice name is ".. tostring(voicename).."." )
	end
)