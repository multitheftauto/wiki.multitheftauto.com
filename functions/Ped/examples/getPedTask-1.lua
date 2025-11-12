local function renderPlayerTasks()
	local textX, textY = 100, 200

	for taskType = 0, 4 do
		local a, b, c, d = getPedTask(localPlayer, "primary", taskType)

		dxDrawText("Primary task #"..taskType.." is "..tostring(a).." -> "..tostring(b).." -> "..tostring(c).." -> "..tostring(d).." -> ", textX, textY)

		textY = (textY + 15)
	end

	textY = (textY + 15)

	for taskType = 0, 5 do
		local a, b, c, d = getPedTask(localPlayer, "secondary", taskType)

		dxDrawText("Secondary task #"..taskType.." is "..tostring(a).." -> "..tostring(b).." -> "..tostring(c).." -> "..tostring(d).." -> ", textX, textY)

		textY = (textY + 15)
	end
end
addEventHandler("onClientRender", root, renderPlayerTasks)