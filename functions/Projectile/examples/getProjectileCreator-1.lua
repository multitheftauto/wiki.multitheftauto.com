addEventHandler("onClientProjectileCreation", root, function(projectile)
    local creator = getProjectileCreator(projectile)
    if (getElementType(creator) == "player") then
        local pName = getPlayerName(creator)
	local projectileID = getProjectileType(projectile)
        outputChatBox(pName.." created a projectile! (ID: "..projectileID..")", 255, 200, 0, false)
    end
end)