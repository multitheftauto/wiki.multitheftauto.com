addEventHandler('onClientRender', root, function()
    dxDrawText('Your console is '..(GuiElement.isConsoleActive() and 'visible' or 'hidden'), 600, 800, 0, 0, 0xFFFFFFFF, 1, 'default-bold')
end)