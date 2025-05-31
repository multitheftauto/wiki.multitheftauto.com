addEventHandler("onClientSoundStream",root,function(suc,length,streamN)
	if not suc then outputChatBox("Sound: "..streamN.." failed to start.",100,0,0) return end
	outputChatBox("The sound: "..streamN.." has finished in "..length.."secs.")
end)