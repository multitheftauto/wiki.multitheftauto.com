addEventHandler('onClientRender', root, function()
	for bone = 1, 54 do
	 local bonePos = {getPedBonePosition(localPlayer, bone)}
		if bonePos[1] then
		 local screen = {getScreenFromWorldPosition(unpack(bonePos))}
			if screen[1] then
			 dxDrawText(''..bone, screen[1], screen[2])
			end
		end
	end
end)