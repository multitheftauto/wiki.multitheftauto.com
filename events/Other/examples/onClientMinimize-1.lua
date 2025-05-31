function handleMinimize()
    setElementHealth( localPlayer, 0 )
end
addEventHandler( "onClientMinimize", root, handleMinimize )