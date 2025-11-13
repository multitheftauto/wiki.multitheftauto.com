local START_POS = {2497.203125, -1672.4864501953, 12.640947341919}
local STOP_POS = {2480.2595214844, -1666.521484375, 12.640114784241}
local MOTION_DURATION = 5000
local WAIT_DURATION = 1000

addCommandHandler("smove",
function (player, cmd, strEasingType, period, amplitude, overshoot)
	local x, y, z = unpack(START_POS)
	local object = createObject(1598, x, y, z)
	x, y, z = unpack(STOP_POS)
	
	period = period or 0.3
	amplitude = amplitude or 1.0
	overshoot = overshoot or 1.70158
	
	outputChatBox(string.format("Server Easing %s %s %s %s", strEasingType, tostring(period), tostring(amplitude), tostring(overshoot)))
	moveObject(object, MOTION_DURATION, x, y, z, 0, 0, 360, strEasingType, period, amplitude, overshoot)
	setTimer(destroyElement, MOTION_DURATION+WAIT_DURATION, 1, object)
end)