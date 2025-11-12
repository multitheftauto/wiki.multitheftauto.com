local tunaColor = tocolor(255, 0, 0, 255) -- Default color

-- This function draws the text
local function drawTuna()
	dxDrawText("Tuna", 5, 5, 100, 100, tunaColor)
end
addEventHandler("onClientRender", root, drawTuna)

--This function handles the /tunaColor command, allowing players to set the color of tuna
local function tunaColorCommand(command, red, green, blue, alpha)
	red, green, blue, alpha = tonumber(red), tonumber(green), tonumber(blue), tonumber(alpha) -- Convert all the args to numbers. NOTE: tonumber will return false if the arg is not provided/is not valid.
	
	-- Remind the user of the proper syntax if they failed to provide all the args
	if not red or not green or not blue then
		outputChatBox("* USAGE: /tunaColor [red] [green] [blue] [alpha]", 255, 0, 0)
		return
	end
	
	-- Make the alpha arg optional
	if not alpha then
		alpha = 255
	end
	
	-- Update the color
	tunaColor = tocolor(red, green, blue, alpha)
end
addCommandHandler("tunaColor", tunaColorCommand)
-- Example /setcoloroftuna 255 0 0 255 - for red.