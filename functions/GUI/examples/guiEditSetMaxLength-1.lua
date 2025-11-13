-- create our button
button = guiCreateButton( 0.7, 0.1, 0.2, 0.1, "Output!", true )
-- create an edit box and define it as "editBox".
editBox = guiCreateEdit( 0.3, 0.1, 0.4, 0.1, "Type your message here!", true )
-- set a maximum text length of 128 characters
guiEditSetMaxLength ( editBox, 128 )

-- setup our function to output the message to the chatbox
function outputEditBox ()
        local text = guiGetText ( editBox )   -- get the text from the edit box
        outputChatBox ( text )                -- output that text
end
addEventHandler ( "onClientGUIClick", button, outputEditBox )