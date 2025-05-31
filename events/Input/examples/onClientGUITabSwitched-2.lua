function OnChange(selectedTab)
	-- If there is a selected tab.
	if selectedTab ~= nil then 
		outputChatBox( "You've changed your active tab." )
	end	
end

addEventHandler("onClientGUITabSwitched", root, OnChange)