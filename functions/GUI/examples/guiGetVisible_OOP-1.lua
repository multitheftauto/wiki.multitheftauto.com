local myWindow = GuiWindow(0, 0, .5, .5, "my window", true) -- Create the gui window

function guiToggleVisible()
    myWindow.visible = not myWindow.visible
end
bindKey("space", "down", guiToggleVisible) -- bind the player's spacebar to the function guiToggleVisible
