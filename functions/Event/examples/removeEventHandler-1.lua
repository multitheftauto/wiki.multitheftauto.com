function drawText() -- A function to draw the text we want
	dxDrawText(text, 10,100) -- creates a dx text 10 pixels from left, 100 from top of the screen
end
function doText(command, ...)
	if command == "starttext" then -- if player wrote /starttext
		text = table.concat({...}," ") -- then we retrieve the text
		addEventHandler("onClientRender", getRootElement(), drawText) 		-- and since addEventHandler and removeEventHandler's syntax is the same, we just define the function we use later
	elseif command == "stoptext" then
		removeEventHandler("onClientRender", getRootElement(), drawText) 	-- this time we use removeEventHandler
	end
end
addCommandHandler("starttext", doText) -- add two command handlers to doText function
addCommandHandler("stoptext", doText)