-- Create a GUI window called 'myWindow'
myWindow = guiCreateWindow( 0.3, 0.3, 0.5, 0.60, "GUI window title", true )

-- Set a timer to change the window's visibility every 2 seconds, indefinitely
setTimer( function( )
	-- We toggle the visibility here by taking the opposite result of guiGetVisible (false => true, true => false), hence toggling its visibility
	guiSetVisible( myWindow, not guiGetVisible( myWindow ) )
end, 2000, 0 )