local x,y,z = 2096.3, 1721, 12.7
local easing = "OutBounce"
local time = 2000
local gate = createObject(980, x,y,z, 0, 0, 63)
local marker = createMarker(x,y,z, "cylinder", 12, 0, 0, 0, 0)
 
function moveGate(hitPlayer, matchingDimension)
        moveObject(gate, time, x+4.9, y+9.6, z, 0, 0, 0, easing)
end
addEventHandler("onMarkerHit", marker, moveGate)
 
function moveBack()
    moveObject(gate, time, x, y, z, 0, 0, 0, easing)
end
addEventHandler("onMarkerLeave", marker, moveBack)