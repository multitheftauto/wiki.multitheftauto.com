local shakeStrength = 1.4 -- define strength of the camera shake
local shakePosX, shakePosY, shakePosZ = 0, 0, 3 -- define position where camera shake would happen

function triggerCameraShake()
	shakeCamera(shakeStrength, shakePosX, shakePosY, shakePosZ) -- trigger camera shake
end
setTimer(triggerCameraShake, 100, 0) -- call this function indefinitely, every 100 ms