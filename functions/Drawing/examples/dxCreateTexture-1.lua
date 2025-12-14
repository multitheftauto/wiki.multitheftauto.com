local myImage

addEventHandler("onClientRender", root, function()
    if myImage then
        dxDrawImage(100, 350, 300, 350, myImage)
    end
end)

-- Use 'toggle' command to switch image on and off
addCommandHandler("toggle", function()
    if not myImage then
        myImage = dxCreateTexture("moonpig.png") -- Create texture
    else
        destroyElement(myImage) -- Destroy texture
        myImage = nil
    end
end)
