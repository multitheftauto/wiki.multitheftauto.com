function updateCamera ()
	local x, y, z = getElementPosition ( localPlayer )
	setCameraMatrix ( x, y, z + 50, x, y, z )
end
addEventHandler ( "onClientPreRender", root, updateCamera )