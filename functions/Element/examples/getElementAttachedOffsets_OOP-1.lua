local obj = Object(2985, 0, 0, 0)
localPlayer:attach(obj, 0.35, 0.2, 0.15, 0, 0, 0)

local ax, ay, az, rx, ry, rz = obj:getAttachedOffsets()
outputConsole(ax, ay, az, rx, ry, rz) -- 0.35, 0.2, 0.15, 0, 0, 0