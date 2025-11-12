addEventHandler ( "onClientRender", root,
function()
	if isPedInVehicle ( localPlayer ) and getPedOccupiedVehicle ( localPlayer ) then
		local veh = getPedOccupiedVehicle ( localPlayer )
		for v in pairs ( getVehicleComponents(veh) ) do
			local x,y,z = getVehicleComponentPosition ( veh, v, "world" )
			local wx,wy,wz = getScreenFromWorldPosition ( x, y, z )
			if wx and wy then
				dxDrawText ( v, wx -1, wy -1, 0 -1, 0 -1, tocolor(0,0,0), 1, "default-bold" )
				dxDrawText ( v, wx +1, wy -1, 0 +1, 0 -1, tocolor(0,0,0), 1, "default-bold" )
				dxDrawText ( v, wx -1, wy +1, 0 -1, 0 +1, tocolor(0,0,0), 1, "default-bold" )
				dxDrawText ( v, wx +1, wy +1, 0 +1, 0 +1, tocolor(0,0,0), 1, "default-bold" )
				dxDrawText ( v, wx, wy, 0, 0, tocolor(0,255,255), 1, "default-bold" )
			end
		end
	end
end)