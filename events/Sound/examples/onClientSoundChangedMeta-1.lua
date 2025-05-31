addEventHandler("onClientSoundChangedMeta", root, function(streamTitle)
    outputChatBox("* Now streaming: "..streamTitle, 255, 200, 0, false)
end)