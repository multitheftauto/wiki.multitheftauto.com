function moveToEndOnClick()
	if ( getKeyState ( "lctrl" ) == true ) and ( getElementType(source) == "gui-edit" ) then          -- if the user is holding down left control
		local text = guiGetText ( source )
		local textLength = string.len ( text )
		guiEditSetCaretIndex ( source, textLength )  -- set the caret index. No need to check if the clicked control is actually an edit box as this function won't work on other controls anyway
	end
end
addEventHandler ( "onClientGUIClick", root, moveToEndOnClick )    -- add an event handler for clicks