function projectileCreating(command,targetPlayer)
    local x,y,z = getElementPosition(getLocalPlayer()) -- Get the position of the player
    local target = getPlayerFromName(targetPlayer) or nil -- Get the target, or set it to nil if no target specified
    local theProjectile = createProjectile(getLocalPlayer(),20,x,y,z+50,1.0,target)
    if (target) then
        outputChatBox("Created projectile's target: "..getPlayerName(getProjectileTarget(theProjectile)))
    else
        outputChatBox("Created projectile with no target")
    end
end
addCommandHandler("rocket",projectileCreating) -- Bind the 'rocket' command to projectileCreating function