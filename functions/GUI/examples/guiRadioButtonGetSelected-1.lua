local label = guiCreateLabel(0.3, 0.35, 0.1, 0.025, "What's your favorite color?", true)

local blue = guiCreateRadioButton(0.3, 0.4, 0.03, 0.015, 'Blue', true)
local green = guiCreateRadioButton(0.3, 0.45, 0.03, 0.015, 'Green', true)
local red = guiCreateRadioButton(0.3, 0.5, 0.03, 0.015, 'Red', true)

addEventHandler('onClientGUIClick', resourceRoot, function()
    if (source ~= label) then
        local selected = guiRadioButtonGetSelected(source)
        if (selected) then
            outputChatBox('Oh! Your favorite color is: '..guiGetText(source))
        end
    end
end)