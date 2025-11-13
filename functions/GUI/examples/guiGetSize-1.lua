local window = guiCreateWindow ( 0, 0, (math.random ( 0, 100 ) / 100), (math.random ( 0, 100 ) / 100), "test", true ) 
-- Create the window
local x, y = guiGetSize ( window, false ) -- Get the gui window size
outputChatBox ( "Window size: " .. x .. " " .. y ) --output the gui window size