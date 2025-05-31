addEventHandler("onClientPlayerVoicePause", root,
    function ()
        outputChatBox(getPlayerName(source) .. "'s voice got paused.")
    end
)