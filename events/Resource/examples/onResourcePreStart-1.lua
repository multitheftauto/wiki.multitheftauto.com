function displayStartingRes(res)
	outputChatBox("Resource "..getResourceName(res).." is going to start.", root, 255, 255, 255)
end
addEventHandler("onResourcePreStart", root, displayStartingRes)