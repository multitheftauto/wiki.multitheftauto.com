addEventHandler( "onClientResourceStart", resourceRoot,
    function( )
        local window = guiCreateWindow( 0.5, 0.5, 0.22, 0.22, "isMovable window", true )
        guiWindowSetMovable( window, false ) -- make it unmovable
        addCommandHandler( "isMovable",
            function( )
                local movable = guiWindowIsMovable( window ) -- check the window movable flag
                outputChatBox( "Window is " .. ( movable and "movable" or "unmovable" ) ) -- show info about the window
            end
        )
    end
)