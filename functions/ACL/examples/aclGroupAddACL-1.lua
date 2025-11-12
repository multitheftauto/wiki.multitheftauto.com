function addAclGroup ( thePlayer, commandName, aclName )
if(aclName) then
    acl = aclCreate ( aclName )
else
    acl = aclCreate("myName")
end
aclGroup = aclGetGroup("Admin")
aclGroupAddACL(aclGroup,acl) -- now all Admins have the rights of acl, too
aclSave () 
addCommandHandler ( "addAclGroup", addAclGroup)