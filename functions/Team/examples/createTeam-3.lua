function createAdminTeamOnStart()
    AdminTeam = createTeam("Admin", 0, 255, 0) -- create a new team and name it 'Admin'
end
addEventHandler("onResourceStart", resourceRoot, createAdminTeamOnStart) -- add an event handler

function setAdminTeam()
    if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) then -- if he is admin
        setPlayerTeam(source, AdminTeam) -- set him to admin team
    end
end
addEventHandler("onPlayerLogin", root, setAdminTeam) -- add an event handler