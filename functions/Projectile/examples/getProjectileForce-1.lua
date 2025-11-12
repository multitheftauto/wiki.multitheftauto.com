addEventHandler("onClientProjectileCreation", getRootElement(),
--The source of this event is the projectile that was created.
function ()
    local getForce = getProjectileForce(source)
    outputChatBox(getForce*100) -- outputs the force of the projectile on 1-100 scale
end
)