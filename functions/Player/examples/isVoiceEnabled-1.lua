-- only if voice enabled
if isVoiceEnabled() then
    -- adding handler for voice start event
    addEventHandler( 'onPlayerVoiceStart', root,
        function()
            -- if player is muted in chat
            -- do not broadcast his voice to other players
            if isPlayerMuted(source) then cancelEvent() end
        end
    )
end