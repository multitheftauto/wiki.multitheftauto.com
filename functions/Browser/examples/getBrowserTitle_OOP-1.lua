addCommandHandler("browsers",
	function()
		outputChatBox("List of browser titles:")
		for k, v in pairs( Element.getAllByType("web-browser") ) do
			outputChatBox(k .. ". " .. v.title)
		end
	end
)