addEventHandler('onClientRender', root, function()
    if (GuiElement.isChatBoxInputActive()) then
        dxDrawText('You\'re typing', 300, 300, 0, 0, 0xFFFFFFFF, 1, 'default-bold')
    end
end)