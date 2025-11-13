local function saveACL(thePlayer, command) -- Function header. Also where thePlayer is defined.
	local saved = ACL.save() -- Save the ACL
	if (saved) then -- If it was successfully saved then...
		thePlayer:outputChat("ACL was successfully saved.", 255, 0, 0) -- Output it saved
	else -- If it wasn't saved for whatever reason then...
		thePlayer:outputChat("An unexpected error occured.", 255, 0, 0) -- Output it didn't save
	end
end
addCommandHandler("save-acl", saveACL) -- Make it trigger for "/save-acl".