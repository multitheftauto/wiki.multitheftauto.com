addEventHandler("onResourceStart", resourceRoot,
	function(resourceElement)
		if resourceElement:isArchived() then
			cancelEvent()
		end
	end
)