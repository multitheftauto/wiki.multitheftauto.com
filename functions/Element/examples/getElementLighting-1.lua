addEventHandler("onClientRender", root, function()
	for _, pl in ipairs(getElementsByType("player", root, true)) do
		local sX, sY = getScreenFromWorldPosition(getElementPosition(pl))
		if sX then
			dxDrawText("Lighting: "..tostring(getElementLighting(pl)), sX, sY)
		end
	end
end)