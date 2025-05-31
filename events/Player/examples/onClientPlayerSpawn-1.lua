function explosionOnSpawn ( )
  -- get the spawned player's position
  local pX, pY, pZ = getElementPosition ( source )
  -- and create an explosion there
  createExplosion ( pX, pY, pZ, 6 )
end
-- add this function as a handler for any player that spawns
addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), explosionOnSpawn )