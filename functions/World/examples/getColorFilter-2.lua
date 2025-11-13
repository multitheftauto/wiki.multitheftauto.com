local shader = [[
float3 colorFilter = float3(1,1,1);
texture sourceTexture;

sampler2D SamplerTex = sampler_state{
    Texture = sourceTexture;
    MipFilter = Linear;
    MinFilter = Linear;
    MagFilter = Linear;
    AddressU = Mirror;
    AddressV = Mirror;
};

float4 colorFilterRemover(float4 color:COLOR0, float2 UV:TEXCOORD0) : COLOR0{
	color *= tex2D(SamplerTex, UV);
	color.rgb /= colorFilter;
	return color;
}

technique cFilterRemover{
	pass P0{
		PixelShader = compile ps_2_0 colorFilterRemover();
	}
}
]]

local cFilterRemover = dxCreateShader(shader)
local testRT = dxCreateRenderTarget(32,32,true)
dxSetShaderValue(cFilterRemover,"sourceTexture",testRT)

x,y,z = 0, 0, 4
size = 4
addEventHandler("onClientRender", root, function()
	dxSetRenderTarget(testRT,true)
	dxDrawRectangle(0,0,32,32,tocolor(255,255,255,255))
	dxSetRenderTarget()

	local aR,aG,aB,aA,bR,bG,bB,bA = getColorFilter(false)							--Get current color filter
	local cR,cG,cB = 127+(aR*aA+bR*bA)/255*0.5, 127+(aG*aA+bG*bA)/255*0.5, 127+(aB*aA+bB*bA)/255*0.5	--Calculate the result color of color filter
	dxSetShaderValue(cFilterRemover,"colorFilter",cR/255,cG/255,cB/255)					--Apply to the color filter remover shader
	dxDrawMaterialLine3D(x+size, y+size, z-0.95, x-size, y-size, z-0.95,false, cFilterRemover, size*2,tocolor(127, 127, 127, 255))
	dxDrawMaterialLine3D(x+size+20, y+size, z-0.95, x-size+20, y-size, z-0.95,false, testRT, size*2,tocolor(127, 127, 127, 255))
end)