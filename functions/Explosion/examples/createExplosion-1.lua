function explosionOnSpawn ( )
  -- get the spawned player's position
  local pX, pY, pZ = getElementPosition ( source )
  -- and create an explosion there, making him the creator
  createExplosion ( pX, pY, pZ, 6, source )
end
-- add this function as a handler for any player that spawns
addEventHandler ( "onPlayerSpawn", root, explosionOnSpawn )