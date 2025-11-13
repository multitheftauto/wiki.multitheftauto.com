addEventHandler( "onClientResourceStart", resourceRoot,
    function( )
        local window = guiCreateWindow( 0.5, 0.5, 0.22, 0.22, "isSizable window", true )
        guiWindowSetSizable( window, false ) -- make it unsizable
        addCommandHandler( "isSizable",
            function( )
                local sizable = guiWindowIsSizable( window ) -- check the window sizable flag
                outputChatBox( "Window is " .. ( sizable and "sizable" or "unsizable" ) ) -- show info about the window
            end
        )
    end
)