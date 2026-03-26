local label = GuiLabel(0.3, 0.35, 0.1, 0.025, "What's your favorite color?", true)

local blue = GuiRadioButton(0.3, 0.4, 0.03, 0.015, 'Blue', true)
local green = GuiRadioButton(0.3, 0.45, 0.03, 0.015, 'Green', true)
local red = GuiRadioButton(0.3, 0.5, 0.03, 0.015, 'Red', true)

addEventHandler('onClientGUIClick', resourceRoot, function()
    if (source ~= label) then
        local selected = source.selected
        if (selected) then
            outputChatBox('Oh! Your favorite color is: '..source.text)
        end
    end
end)