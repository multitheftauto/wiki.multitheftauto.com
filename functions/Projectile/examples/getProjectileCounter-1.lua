function getProjectileBoomTime()
outputChatBox("Time for "..getProjectileType(source).." to explode/end is "..getProjectileCounter(source).." miliseconds.",255,0,0)
end
addEventHandler("onClientProjectileCreation",root,getProjectileBoomTime)