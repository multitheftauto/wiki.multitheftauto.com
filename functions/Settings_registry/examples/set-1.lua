function setAclRights(playerElement, commandName, acl, value, type)
   if not acl or not value then
      return outputChatBox("Syntax: /setacl <acl> <value>")
   end
   if set ( acl, value ) then
      outputChatBox("Acl "..acl.." value set to "..value)
      print(getPlayerName(playerElement).." has changed "..acl.." to "..value)
   else
      outputChatBox("Error happened while changing the Acl "..acl.." value to "..value)
      print(getPlayerName(playerElement).." tried to change "..acl.." to "..value)
   end
end
addCommandHandler("setacl", setAclRights)