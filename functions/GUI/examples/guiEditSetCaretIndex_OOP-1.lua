-- Create a window
local window = GuiWindow(0.3, 0.3, 0.4, 0.4, "Edit Box Caret Example", true)

-- Create an edit box
local editBox = GuiEdit(0.1, 0.2, 0.8, 0.3, "Hello World", true, window)

-- Create buttons to move caret
local buttonLeft = GuiButton(0.1, 0.6, 0.35, 0.15, "Move Left", true, window)
local buttonRight = GuiButton(0.55, 0.6, 0.35, 0.15, "Move Right", true, window)

addEventHandler('onClientGUIClick', resourceRoot, function()
    if (source == buttonLeft) then -- move caret to the left
        editBox.caretIndex = math.max(0, editBox.caretIndex - 1)
    elseif (source == buttonRight) then -- move caret to the right
        editBox.caretIndex = math.min(#editBox.text, editBox.caretIndex + 1)
    end
end)