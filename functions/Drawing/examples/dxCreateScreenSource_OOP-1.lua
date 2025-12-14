local myScreenSource

addEventHandler("onClientResourceStart", resourceRoot, function()
    myScreenSource = DxScreenSource(640, 480) -- Create a screen source texture which is 640 x 480 pixels
end)

addEventHandler("onClientRender", root, function()
    if myScreenSource then
        myScreenSource:update() -- Capture the current screen output from GTA
        dxDrawImage(50, 50, 100, 100, myScreenSource) -- Now use myScreenSource as a material and draw it lots of times
        dxDrawImage(150, 350, 150, 100, myScreenSource)
        dxDrawImage(250, 250, 100, 150, myScreenSource)
        dxDrawImage(350, 30, 150, 150, myScreenSource)
    end
end)
