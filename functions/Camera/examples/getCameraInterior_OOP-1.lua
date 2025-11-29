function outputCameraInterior ( command )
	local interior = Camera.interior -- or Camera.getInterior()
	outputChatBox ( "The camera is in the interior " .. interior, localPlayer, 255, 255, 0 )
end
addCommandHandler ( "camera", outputCameraInterior )