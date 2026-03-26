local label = GuiLabel(0.3, 0.35, 0.1, 0.025, "What's your favorite color?", true)

local blue = GuiRadioButton(0.3, 0.4, 0.03, 0.015, 'Blue', true)
local green = GuiRadioButton(0.3, 0.45, 0.03, 0.015, 'Green', true)
local red = GuiRadioButton(0.3, 0.5, 0.03, 0.015, 'Red', true)

addCommandHandler('favcolor', function(cmd, color)
    if (not tostring(color)) then
        outputChatBox('Use /favcolor <color>')
        return
    end

    color = color:lower()
    if (color == 'blue') then
        blue.selected = true
    elseif (color == 'green') then
        green.selected = true
    elseif (color == 'red') then
        red.selected = true
    else
        outputChatBox('Wrong color!')
    end
end)