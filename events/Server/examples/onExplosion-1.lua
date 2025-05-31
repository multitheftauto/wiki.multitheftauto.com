local debugMsgLevel = 4
local debugMsgR = 255
local debugMsgG = 127
local debugMsgB = 0
local explosionTypes = {
	[0] = "Grenade",
	[1] = "Molotov",
	[2] = "Rocket",
	[3] = "Rocket Weak",
	[4] = "Car",
	[5] = "Car Quick",
	[6] = "Boat",
	[7] = "Aircraft",
	[8] = "Mine",
	[9] = "Object",
	[10] = "Tank Grenade",
	[11] = "Small",
	[12] = "Tiny",
}

function onExplosion(explosionX, explosionY, explosionZ, explosionType)
	local explosionPos = explosionX..", "..explosionY..", "..explosionZ
	local explosionTypeName = explosionTypes[explosionType]
	local explosionSource = inspect(source)
	local debugMsg = explosionTypeName.." explosion has occured at "..explosionPos.." (source: "..explosionSource..")"

	outputDebugString(debugMsg, debugMsgLevel, debugMsgR, debugMsgG, debugMsgB)
end
addEventHandler("onExplosion", root, onExplosion)