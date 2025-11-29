function outputCameraInterior ( player, command )
	local interior = getCameraInterior ( player )
	outputChatBox ( "The camera is in the interior " .. interior, player, 255, 255, 0 )
end
addCommandHandler ( "camera", outputCameraInterior )