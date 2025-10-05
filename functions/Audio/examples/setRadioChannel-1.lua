addCommandHandler ( "setradio",
    function ( command, stationID )
        local result = setRadioChannel ( tonumber( stationID ) )
        if result then -- if we had a valid ID
            outputChatBox ( "Changed your radio station to " .. getRadioChannelName ( tonumber ( stationID ) ) .. "!" )
        else
            outputChatBox ( "Invalid radio station ID, valid ones are 0-12." )
        end
    end
)