-- create our button
local button = GuiButton(0.7, 0.1, 0.2, 0.1, "Output!", true)
-- Create an edit box and define it as "editBox".
local editBox = GuiEdit(0.3, 0.1, 0.4, 0.1, "", true)
editBox.maxLength = 128 -- the max chatbox length is 128, so force this

-- setup our function to output the message to the chatbox
function outputEditBox()
    local text = editBox.text -- get the text from the edit box
    outputChatBox(text) -- output that text
end
addEventHandler("onClientGUIClick", button, outputEditBox)
