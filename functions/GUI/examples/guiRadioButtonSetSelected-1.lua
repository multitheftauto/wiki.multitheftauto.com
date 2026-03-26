local label = guiCreateLabel(0.3, 0.35, 0.1, 0.025, "What's your favorite color?", true)

local blue = guiCreateRadioButton(0.3, 0.4, 0.03, 0.015, 'Blue', true)
local green = guiCreateRadioButton(0.3, 0.45, 0.03, 0.015, 'Green', true)
local red = guiCreateRadioButton(0.3, 0.5, 0.03, 0.015, 'Red', true)

addCommandHandler('favcolor', function(cmd, color)
    if (not tostring(color)) then
        outputChatBox('Use /favcolor <color>')
        return
    end

    color = color:lower()
    if (color == 'blue') then
        guiRadioButtonSetSelected(blue, true)
    elseif (color == 'green') then
        guiRadioButtonSetSelected(green, true)
    elseif (color == 'red') then
        guiRadioButtonSetSelected(red, true)
    else
        outputChatBox('Wrong color!')
    end
end)