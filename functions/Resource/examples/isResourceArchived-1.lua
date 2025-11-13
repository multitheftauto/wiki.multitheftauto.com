addEventHandler("onResourceStart", resourceRoot,
	function(resourceElement)
		if isResourceArchived(resourceElement) then
			cancelEvent()
		end
	end
)