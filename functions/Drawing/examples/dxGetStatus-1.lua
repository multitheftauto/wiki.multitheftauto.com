addCommandHandler("getinfo",
	function ()
		local info = dxGetStatus ()
		for k, v in pairs (info) do
			outputChatBox (k .. " : " .. tostring (v))
		end
	end
)