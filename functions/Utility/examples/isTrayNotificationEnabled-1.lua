addCommandHandler("traynotifs",
    function ()
        if isTrayNotificationEnabled( ) then
            outputChatBox( "* Tray notifications are enabled" )
        else
            outputChatBox( "* Tray notifications are disabled" )
        end
    end
)