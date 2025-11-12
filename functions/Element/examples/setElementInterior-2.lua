function interior ( commandName, interior )
  --Let's see if they gave a interior ID
  if ( interior ) then
    --They did, so let's assign them to that interior and teleport them there (all in 1 function call!)
    setElementInterior ( localPlayer, interior, 2233.91, 1714.73, 1011.38 )
  else
    --They didn't give one, so set them to the interior they wanted, but don't teleport them.
    setElementInterior ( localPlayer, 0 )
  end
end
addCommandHandler ( "interior", interior )