addEventHandler ( "onClientRender", root,
function ( )
	if ( getDistanceBetweenPoints3D ( 0, 0, 3, getElementPosition ( localPlayer ) ) ) < 50 then
		local coords = { getScreenFromWorldPosition ( 0, 0, 3 ) }
		if coords[1] and coords[2] then
			dxDrawText ( "Hello !", coords[1], coords[2], coords[1], coords[2], tocolor(255,255,255), 1, "default-bold" )
		end
	end
end )