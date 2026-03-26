local myWindow = GuiWindow(0.30, 0.10, 0.5, 0.60, "GUI window title", true)

-- Add a command handler to change the alpha of the GUI window.
-- Usage example: '/windowAlpha 0.8', where 0.8 is stored as alphaAmount
function changeAlpha(commandName, alphaAmount)
    if (not tonumber(alphaAmount)) then
        return
    end

    myWindow.alpha = tonumber(alphaAmount)
end
addCommandHandler("windowAlpha", changeAlpha)
