-- We create a dummy gui label to get text of
local dummyGUIElement = guiCreateLabel ( 0.45, 0.48, 0.10, 0.04, "Hello world", true )
guiSetFont ( dummyGUIElement, "sa-gothic" )
-- Output the font of the label to chat box
outputChatBox ( "Font used in the GUI label: " .. guiGetFont ( dummyGuiElement ) )