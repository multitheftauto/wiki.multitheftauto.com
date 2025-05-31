function targetingActivated ( target )
	if ( target ) then
		outputChatBox(tostring(getElementType(target)))
	end
end
addEventHandler ( "onClientPlayerTarget", getRootElement(), targetingActivated )