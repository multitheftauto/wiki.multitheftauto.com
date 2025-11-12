-- We create a dummy gui label to get text of
local dummyGUIElement = guiCreateLabel ( 0.45, 0.48, 0.10, 0.04, "Hello world", true )
-- Output the text of the label to chat box
outputChatBox ( "Text in the GUI label: " .. guiGetText ( dummyGUIElement ) )