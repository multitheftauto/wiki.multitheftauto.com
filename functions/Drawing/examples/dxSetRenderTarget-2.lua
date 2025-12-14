local myRenderTarget

addEventHandler("onClientResourceStart", resourceRoot, function()
    myRenderTarget = dxCreateRenderTarget(80, 100) -- Create a render target texture which is 80 x 100 pixels
    dxSetRenderTarget(myRenderTarget) -- Select custom render target for drawing
    dxDrawRectangle(2, 2, 60, 60, tocolor(255, 255, 0)) -- Draw anything you like (to the render target)
    dxDrawText("Hello", 10, 20)
    dxDrawText("This is", 10, 40)
    dxDrawText("Amazing", 10, 60)
    dxSetRenderTarget() -- Unselect custom render target
end)

addEventHandler("onClientRender", root, function()
    if myRenderTarget then
        dxDrawImage(100, 200, 80, 100, myRenderTarget) -- Draw myRenderTarget content to the screen
    end
end)
