-- When client's resource starts, create the GUI
function initGUI( )
    -- Create our button
    btnOutput = guiCreateButton( 0.7, 0.1, 0.2, 0.1, "Output!", true )

    -- And attach our button to the outputEditBox function
    addEventHandler ( "onClientGUIClick", btnOutput, outputEditBox, false )

    -- Create an edit box and define it as "editBox".
    editBox = guiCreateEdit( 0.3, 0.1, 0.4, 0.1, "Type your message here!", true )
    guiEditSetMaxLength ( editBox, 128 ) -- The max chatbox text length is 128, so force this
end
addEventHandler( "onClientResourceStart", resourceRoot, initGUI )

-- Setup our function to output the message to the chatbox
function outputEditBox ( button )
    if button == "left" then
        local text = guiGetText ( editBox )-- Get the text from the edit box
        outputChatBox ( text ) -- Output that text
    end
end