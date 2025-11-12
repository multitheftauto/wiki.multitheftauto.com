local tPed = {}
addEventHandler( "onClientPlayerSpawn", localPlayer,
    function()
        local x, y, z = getElementPosition(source)
        if isElement(tPed["thePed"]) then
            destroyElement(tPed["thePed"])
        end
        -- Creates a random ped near player
        tPed["thePed"] = createPed(math.random(209, 238), x+1, y+1, z)
    end
)

function toggleColisionFunc()
    if not isElement(tPed["thePed"]) then
        return
    end
    -- Is the local player collidable with the ped?
    local isCollidable = isElementCollidableWith( localPlayer, tPed["thePed"] )
    -- Toggles the colision with the ped.
    setElementCollidableWith( localPlayer, tPed["thePed"], not isCollidable )
end
-- Adds a command handler to enable/disable colisions with the ped
addCommandHandler("togglecol", toggleColisionFunc)