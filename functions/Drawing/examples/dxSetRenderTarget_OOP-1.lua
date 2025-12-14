local myRenderTarget

addEventHandler("onClientResourceStart", resourceRoot, function()
    myRenderTarget = DxRenderTarget(80, 100) -- Create a render target texture which is 80 x 100 pixels
end)

addEventHandler("onClientRender", root, function()
    if myRenderTarget then
        myRenderTarget:setAsTarget() -- Select custom render target
        dxDrawText("Hello", 10, 20) -- The message 'Hello' will be drawn on myRenderTarget

        dxSetRenderTarget() -- Select default render target
        dxDrawText("Goodbye", 10, 20) -- The message 'Goodbye' will be drawn directly to the screen
    end
end)
