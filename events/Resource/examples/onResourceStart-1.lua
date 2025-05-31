function displayLoadedRes ( res )
	outputChatBox ( "Resource " .. getResourceName(res) .. " loaded", root, 255, 255, 255 )
end
addEventHandler ( "onResourceStart", root, displayLoadedRes )