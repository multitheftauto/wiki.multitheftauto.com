-- Create a simple button
local myButton = GuiButton(0.30, 0.15, 0.05, 0.03, "Click me", true)

-- Attach a click event to the button to change its text
addEventHandler("onClientGUIClick", myButton, function()
    myButton.text = 'Hello!'
end)