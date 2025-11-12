function deleteTabOnClick ()
	if ( getKeyState ( "lctrl" ) == true ) and ( getElementType( source ) == "gui-tab" ) then    -- if the user is holding down left control
		guiDeleteTab ( source, getElementParent(source) )                -- delete the tab. No need to check if it was actually a tab that was clicked, as this function doesn't work on other controls anyway
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(), deleteTabOnClick  )    -- add an event handler for clicks