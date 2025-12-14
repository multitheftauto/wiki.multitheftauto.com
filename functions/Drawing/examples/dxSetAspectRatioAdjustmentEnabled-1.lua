local scx, scy = guiGetScreenSize()

addEventHandler("onClientRender", root, function()
    dxDrawText("Hello", 300, 300) -- Text will be drawn at 300,300
    dxSetAspectRatioAdjustmentEnabled(true)
    dxDrawText("Goodbye", 0.78 * scx, 0.22 * scy) -- Text will be drawn just below HUD money, with any aspect ratio
end)
