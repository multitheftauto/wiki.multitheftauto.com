--------------------------------------------------
-- Take screen shot every 2 seconds
function doTakeScreenShot()
    takePlayerScreenShot( getRandomPlayer(), 320, 200 )
end
setTimer(doTakeScreenShot, 2000, 0)

--------------------------------------------------
-- Receive screen shot result
addEventHandler( "onPlayerScreenShot", root,
    function ( theResource, status, pixels, timestamp, tag )
        triggerClientEvent( root, "onMyClientScreenShot", resourceRoot, pixels )  -- Relay to all players
    end
)