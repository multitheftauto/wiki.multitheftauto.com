addEventHandler( "onClientRender", root,
    function()
        if myShader then
            dxDrawImage( 100, 350, 300, 350, myShader )
        end
    end
)

-- Use 'toggle' command to switch shader on and off
addCommandHandler( "toggle",
    function()
        if not myShader then
            myShader = dxCreateShader( "fancything.fx" )  -- Create shader
        else        
            destroyElement( myShader )                    -- Destroy shader
            myShader = nil
        end
    end
)