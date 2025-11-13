function interior ( source, commandName, interior )
  --Let's see if they gave an interior ID
  if ( interior ) then
    --They did, so lets assign them to that interior and teleport them there (all in 1 function call!)
    setElementInterior ( source, interior, 2233.91, 1714.73, 1011.38 )
  else
    --They didn't give one, so set them to the interior they wanted, but don't teleport them.
    setElementInterior ( source, 0 )
  end
end
addCommandHandler ( "interior", interior )