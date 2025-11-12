function onPickupHitFunction ( thePlayer )
    if getPickupType ( source ) == 0 then      -- check the type of pickup, if it is a health pickup then
        amount = getPickupAmount ( source )
        outputChatBox ( "You picked up " .. amount .. " health", thePlayer)
    end
end
addEventHandler ( "onPickupHit", root, onPickupHitFunction )   -- add an event handler for onPickupHit