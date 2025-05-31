addEventHandler ( "onClientPlayerChangeNick", getLocalPlayer(),
    function ( oldNick, newNick )
        outputChatBox ( "Hi " .. oldNick .. "! Oh... You're not " .. oldNick .. " anymore, are you?", 0, 255, 0 )
        outputChatBox ( "I like your new name, " .. newNick .. "!", 0, 255, 0 )
    end
)