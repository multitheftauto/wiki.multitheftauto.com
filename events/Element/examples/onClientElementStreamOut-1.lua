addEventHandler( "onClientElementStreamOut", root, 
    function ()
        if getElementType(source) == "player" then
            local x, y, z = getElementPosition(localPlayer)
            local xh, xy, xz = getElementPosition(source)
            local distance = getDistanceBetweenPoints3D(x, y, z, xh, xy, xz )
            outputChatBox( "A player has just streamed out. Distance to the player: " .. tostring(distance) .."." )
        end
    end
)