local function saveACL(thePlayer, command) -- Function header. Also where thePlayer is defined.
	local saved = aclSave() -- Save the ACL
	if (saved) then -- If it was successfully saved then...
		outputChatBox("ACL was successfully saved.", thePlayer, 255, 0, 0) -- Output it saved
	else -- If it wasn't saved for whatever reason then...
		outputChatBox("An unexpected error occured.", thePlayer, 255, 0, 0) -- Output it didn't save
	end
end
addCommandHandler("save-acl", saveACL) -- Make it trigger for "/save-acl".