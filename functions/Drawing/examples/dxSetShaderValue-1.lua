myShader = dxCreateShader( "hello.fx" )
myTexture = dxCreateTexture( "man.png" )
dxSetShaderValue( myShader, "texture0", myTexture )                -- Set a texture
dxSetShaderValue( myShader, "bShowThing", true )                  -- Set a bool                  
dxSetShaderValue( myShader, "speed", 2.4 )                        -- Set a float
dxSetShaderValue( myShader, "positionOfCheese", 100, 200, 300 )   -- Set a list of numbers, with max 16 numbers. Btw, this is a float: 3.4. This can be used to fill an array in HLSL.