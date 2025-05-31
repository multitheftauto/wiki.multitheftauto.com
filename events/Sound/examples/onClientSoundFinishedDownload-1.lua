addEventHandler("onClientSoundFinishedDownload",root,function(length)
	local meta = getSoundMetaTags(source)
	outputChatBox("The sound: "..(meta.title).." has finished in :"..length.."ms.")
end)