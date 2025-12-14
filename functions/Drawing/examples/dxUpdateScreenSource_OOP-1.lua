local myScreenSource

addEventHandler("onClientResourceStart", resourceRoot, function()
    myScreenSource = DxScreenSource(500, 500) -- Create a screen source texture which is 500 x 500 pixels
end)

bindKey("F7", "down", function()
    if myScreenSource then
        myScreenSource:update() -- Capture the screen
    end
end)

addEventHandler("onClientRender", root, function()
    if myScreenSource then
        dxDrawImage(0, 0, 300, 300, myScreenSource) -- Draw the result in top left corner
    end
end)
