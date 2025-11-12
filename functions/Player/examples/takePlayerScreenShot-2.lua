function requestScreenshot()
	takePlayerScreenShot(client,320,240,"cameraphoto",50) -- the player just took a picture with the camera, let's request a screenshot to see what they took a photo of
end
addEvent("onPlayerTakesPhoto",true)
addEventHandler("onPlayerTakesPhoto",root,requestScreenshot)

function incomingPlayerScreenshot(res,status,img,timestamp,tag)
	if status == "ok" and tag == "cameraphoto" then -- make sure a picture was taken successfully and that we're the ones who requested this screenshot
		triggerClientEvent("updatePhoto",source,img)  -- trigger a client event to share the image with everyone on the server
	end
end
addEventHandler("onPlayerScreenShot",root,incomingPlayerScreenshot)