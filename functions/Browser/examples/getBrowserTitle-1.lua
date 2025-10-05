addCommandHandler("browsers",
	function()
		outputChatBox("List of browser titles:")
		for k, v in pairs( getElementsByType("web-browser") ) do
			outputChatBox(k .. ". " .. getBrowserTitle(v))
		end
	end
)