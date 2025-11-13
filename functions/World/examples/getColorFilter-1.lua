local testRT = dxCreateRenderTarget(32,32,true)

x,y,z = 0, 0, 4
size = 4
addEventHandler("onClientRender", root, function()
	dxSetRenderTarget(testRT,true)
	dxDrawRectangle(0,0,32,32,tocolor(255,255,255,255))
	dxSetRenderTarget()

	local aR,aG,aB,aA,bR,bG,bB,bA = getColorFilter(false)							--Get current color filter
	local cR,cG,cB = 127/255+(aR*aA+bR*bA)/65535*0.5, 127/255+(aG*aA+bG*bA)/65535*0.5, 127/255+(aB*aA+bB*bA)/65535*0.5	--Calculate the result color of color filter
	dxDrawMaterialLine3D(x+size, y+size, z-0.95, x-size, y-size, z-0.95,false, testRT, size*2,tocolor(127, 127, 127, 255))
	dxDrawMaterialLine3D(x+size+20, y+size, z-0.95, x-size+20, y-size, z-0.95,false, testRT, size*2,tocolor(127/cR, 127/cG, 127/cB, 255))
end)