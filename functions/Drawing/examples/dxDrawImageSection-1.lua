local myimg = dxCreateTexture("myimage.png") -- Make This Image as texture 

addEventHandler('onClientRender', root, function()
    if (myimg) then
        dxDrawImageSection(400, 200, 100, 100, 0, 0, 100, 100, myimg) -- draw image section that clip part of image from start of image to 100 as width and height 
    end
end)
