addEventHandler("onPlayerSpawn",root,function()
     if not isElementVisibleTo(source,source) then --if the player is not visible to them selves
          setElementVisibleTo(source,source,true) --then make them visible to them selves.
     end
end)