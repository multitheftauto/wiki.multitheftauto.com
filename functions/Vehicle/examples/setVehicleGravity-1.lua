addEventHandler("onClientVehicleEnter",getRootElement(),function(thePlayer)
	if (thePlayer == localPlayer) then -- if thePlayer is localPlayer
		local gravity = setVehicleGravity(source,0,0,0) -- Set the gravity
		if (gravity) then -- If the gravity was set succesfully
			local gravity_pos = Vector3(getVehicleGravity(source)) -- get the gravity vector
			outputChatBox("Gravity was set to "..gravity_pos.x.." "..gravity_pos.y.." "..gravity_pos.z,0,255,0) -- output to chat
		end
	end
end)