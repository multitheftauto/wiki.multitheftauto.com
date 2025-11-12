function pedRotate ( )
    local rotX, rotY, rotZ = getElementRotation(localPlayer) -- get the local players's rotation
    setElementRotation(localPlayer,0,0,rotZ+10,"default",true) -- turn the player 10 degrees clockwise
end
addCommandHandler ( "turn", pedRotate )