function outputCameraInterior ( player, command )
	local interior = player.cameraInterior -- or player:getCameraInterior()
	outputChatBox ( "The camera is in the interior " .. interior, player, 255, 255, 0 )
end
addCommandHandler ( "camera", outputCameraInterior )