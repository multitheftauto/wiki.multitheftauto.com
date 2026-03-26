local myWindow = guiCreateWindow(0, 0, .5, .5, "my window", true) -- Create the gui window

function guiToggleVisible()
    if (guiGetVisible(myWindow)) then -- check if the gui element is visible               
        guiSetVisible(myWindow, false) -- if it is, we hide it
    else
        guiSetVisible(myWindow, true) -- if not, we make it visible
    end
end
bindKey("space", "down", guiToggleVisible) -- bind the player's spacebar to the function guiToggleVisible
