local shaderRawStr = [[
    texture MACRO_TEX_NAME;

    technique simple
    {
        pass P0
        {
            //-- Set up texture stage 0
            Texture[0] = MACRO_TEX_NAME;
	    ColorOp[0] = SelectArg1;
	#ifdef MACRO_FIRST_ARG
	    ColorArg1[0] = Texture;
	#else
	    ColorArg1[0] = Diffuse;
	#endif
	    AlphaOp[0] = SelectArg1;
	    AlphaArg1[0] = Texture;
                
            //-- Disable texture stage 1
            ColorOp[1] = Disable;
            AlphaOp[1] = Disable;
        }
    }
]]

addEventHandler( "onClientResourceStart", resourceRoot,
    function ( )
        local shader, tech = dxCreateShader( shaderRawStr,  { MACRO_TEX_NAME = "Tex0",  MACRO_FIRST_ARG = true } )
        if not shader or tech ~= "simple" then
            outputDebugString( "An error was occured" )
	    return
        end	
        
        local texture = dxCreateTexture( "test.png" )
        if not texture then
	    outputDebugString( "An error was occured" )
	    return
	end

	dxSetShaderValue( shader, "Tex0", texture )
		
	addEventHandler( "onClientRender", root,
	    function()
	        dxDrawImage( 0, 0, 500, 500, shader )
	    end
	, false )
    end
, false )