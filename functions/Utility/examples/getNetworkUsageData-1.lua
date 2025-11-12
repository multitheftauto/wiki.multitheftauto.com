addCommandHandler("nd",
	function ()
		local networkData = getNetworkUsageData()["in"]
		for i, val in pairs(networkData["count"]) do
			if networkData["bits"][i] > 0 then
				outputChatBox("ID: " .. i .. ": " .. val .. " - " .. networkData["bits"][i] .. "b")
			end
		end
end)