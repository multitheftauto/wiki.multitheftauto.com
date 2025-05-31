addEventHandler("onClientPlayerVoiceResumed", root,
    function ()
        outputChatBox(getPlayerName(source) .. "'s voice got resumed.")
    end
)