--------------------------------------------------
-- Turn image data into a texture at the client
addEvent("onMyClientScreenShot",true)
addEventHandler( "onMyClientScreenShot", resourceRoot,
    function( pixels )
        if image then
            destroyElement(image)
        end
        image = dxCreateTexture( pixels )
    end
)

--------------------------------------------------
-- Show image
addEventHandler( "onClientRender", root,
    function()
        if image then
            dxDrawImage( 100, 250, 320, 200, image )
        end
    end
)