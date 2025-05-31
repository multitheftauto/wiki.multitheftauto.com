function onMyMouseDoubleClick (button, absoluteX, absoluteY, worldX, worldY,  worldZ, clickedWorld)
	if button == "left" then 
		playSoundFrontEnd(40)
	end
end
addEventHandler("onClientDoubleClick", root, onMyMouseDoubleClick)