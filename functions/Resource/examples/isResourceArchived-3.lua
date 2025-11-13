addEventHandler("onResourceStart", resourceRoot,
	function(resourceElement)
		if resourceElement.archived then
			cancelEvent()
		end
	end
)