-- Offsets
local x, y, z, rx, ry, rz = 0, -1.5, -0.1, 0, 0, -90

function createArmedBobcat(cmd)
    local lx, ly, lz = getElementPosition(localPlayer) -- get the position of the player
    lx = lx + 5 -- add 5 units to the x position

    local veh = createVehicle(422, lx, ly, lz) -- create a bobcat
    local base = createObject(2985, 2, 2, 2) -- create a minigun_base object
    setElementCollisionsEnabled(base, false) -- the minigun_base damages the car
    -- you could alternatively load an empty col file for the minigun object
    attachElements(base, veh, x, y, z, rx, ry, rz) -- attach the base to the bobcat
end

function rotateIt(cmd, addZ)
    if (addZ) then
        local x, y, z, rx, ry, rz = getElementAttachedOffsets(base) -- get the offsets
        rz = rz + addZ
        setElementAttachedOffsets(base, x, y, z, rx, ry, rz) -- update offsets
    end
end

addCommandHandler("bobcat", createArmedBobcat)
addCommandHandler("rotate", rotateIt)
