addEventHandler("onClientBrowserLoadingFailed", root,
	function(url, errorCode, errorDescription)
		outputChatBox("This webpage is not available" .. url .. "Unknown" .. errorCode .. "Unknown" .. errorDescription)
	end
)