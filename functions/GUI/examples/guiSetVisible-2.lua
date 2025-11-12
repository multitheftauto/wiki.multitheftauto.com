addEventHandler( "onClientResourceStart", resourceRoot,
	function( )
		newgui.wind[ 1 ] = guiCreateWindow( 434, 304, 280, 123, "New Window", false )
		guiWindowSetSizable( newgui.wind[ 1 ], false )

		newgui.button[ 1 ] = guiCreateButton( 35, 46, 87, 40, "yes", false, newgui.wind[ 1 ] )
		newgui.button[ 2 ] = guiCreateButton( 166, 49, 92, 37, "no", false, newgui.wind[ 1 ] )

		showCursor( true )
	end
)

bindKey( "x", "down",
	function( )
		local state = not guiGetVisible( newgui.wind[ 1 ] )
		guiSetVisible( newgui.wind[ 1 ], state )
		showCursor( state )
	end
)