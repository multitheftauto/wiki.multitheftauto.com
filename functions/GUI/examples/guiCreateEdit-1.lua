--create our button
button = guiCreateButton( 0.7, 0.1, 0.2, 0.1, "OK", true )
--Create an edit box and define it as "editBox".
editBox = guiCreateEdit( 0.3, 0.1, 0.4, 0.1, "", true )
guiEditSetMaxLength ( editBox, 128 ) --the max chatbox length is 128, so force this

--setup our function to output the message to the chatbox
function outputEditBox ()
        local text = guiGetText ( editBox )--get the text from the edit box
        outputChatBox ( text ) --output that text
end
addEventHandler ( "onClientGUIClick", button, outputEditBox )