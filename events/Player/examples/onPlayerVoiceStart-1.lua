addEventHandler( 'onPlayerVoiceStart', root,
    function()
        -- if player is not logged in
        -- do not broadcast his voice to other players
        if isGuestAccount( getPlayerAccount(source) ) then
            cancelEvent()
        end
    end
)