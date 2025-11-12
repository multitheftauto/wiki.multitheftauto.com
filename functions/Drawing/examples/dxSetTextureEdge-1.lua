local renderTarget1 = dxCreateScreenSource(300, 300)
dxSetTextureEdge(renderTarget1, "wrap")
local renderTarget2 = dxCreateScreenSource(300, 300)
dxSetTextureEdge(renderTarget2, "mirror")
local renderTarget3 = dxCreateScreenSource(300, 300)
dxSetTextureEdge(renderTarget3, "clamp")
local renderTarget4 = dxCreateScreenSource(300, 300)
dxSetTextureEdge(renderTarget4, "border", tocolor(255, 0, 0))

addEventHandler("onClientRender", root,
	function()
		-- Update the screen sources
		dxUpdateScreenSource(renderTarget1)
		dxUpdateScreenSource(renderTarget2)
		dxUpdateScreenSource(renderTarget3)
		dxUpdateScreenSource(renderTarget4)
	
		-- Draw screen sources in different modes
		dxDrawImageSection(20, 200, 300, 300, -50, 0, 100, 100, renderTarget1)
		dxDrawImageSection(350, 200, 300, 300, -50, 0, 100, 100, renderTarget2)
		dxDrawImageSection(680, 200, 300, 300, -50, 0, 100, 100, renderTarget3)
		dxDrawImageSection(1010, 200, 300, 300, -50, 0, 100, 100, renderTarget4)
	end
)