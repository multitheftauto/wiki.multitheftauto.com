local w, h = guiGetScreenSize ()
local tx, ty, tz = getWorldFromScreenPosition ( w/2, h/2, 50 )
local px, py, pz = getCameraMatrix()
hit, x, y, z, elementHit = processLineOfSight ( px, py, pz, tx, ty, tz )
if hit then
    outputChatBox ( "Looking at " .. x .. ", " .. y .. ", " ..  z )
    if elementHit then
        outputChatBox ( "Hit element " .. getElementType(elementHit) )
    end
end