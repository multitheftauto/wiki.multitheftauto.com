function initialize ()
	-- Create a gui window
	local window = guiCreateWindow ( 0.50, 0.50, 0.25, 0.25, "Test", true )
	-- set it to be not sizable
	guiWindowSetSizable ( window, false )
	-- Show cursor to check if our changes work fine
	showCursor ( true )
end
addEventHandler ( "onClientResourceStart", resourceRoot, initialize )