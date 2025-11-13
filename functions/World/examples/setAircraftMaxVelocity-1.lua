function handleKeyboard( key, state )

    if state then

        if key == "num_add" then

            local fMaxVelocity = getAircraftMaxVelocity() + 0.1

            if setAircraftMaxVelocity( fMaxVelocity ) then
                outputChatBox( string.format( "Max velocity set to %.1f", fMaxVelocity ))
            else
                outputChatBox( string.format( "Unable to set max velocity to %.1f", fMaxVelocity ) )
            end

        elseif key == "num_sub" then

            local fMaxVelocity = getAircraftMaxVelocity() - 0.1

            if setAircraftMaxVelocity( fMaxVelocity ) then
                outputChatBox( string.format( "Max velocity set to %.1f", fMaxVelocity ) )
            else
                outputChatBox( string.format( "Unable to set max velocity to %.1f", fMaxVelocity ) )
            end
        end
    end
end

addEventHandler( "onClientKey", root, handleKeyboard )