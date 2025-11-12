function createPasswordEdit( )
    local password = guiCreateEdit( 0.845, 0.94, 0.15, 0.05, "password", true ) -- create edit box for a password
    if password then -- if it was successfully created
        guiEditSetMasked( password, true ) -- make it masked
    end
    addCommandHandler( "isMasked",
        function( )
            local masked = guiEditIsMasked( password ) -- check the edit box masked flag
            outputChatBox( "Edit field is " .. ( masked and "masked" or "not masked" ) ) -- show info about edit box
        end
    )
end
addEventHandler( "onClientResourceStart", resourceRoot, createPasswordEdit )