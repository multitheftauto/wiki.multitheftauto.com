local glitchesData = {
	["quickreload"] = false,
	["fastmove"] = false,
	["fastfire"] = false,
	["crouchbug"] = false,
	["highcloserangedamage"] = false,
	["hitanim"] = false,
	["fastsprint"] = false,
	["baddrivebyhitbox"] = false,
	["quickstand"] = false,
	["kickoutofvehicle_onmodelreplace"] = false,
	["vehicle_rapid_stop"] = false,
}

local function toggleGlitches()
	for glitchName, glitchState in pairs(glitchesData) do
		setGlitchEnabled(glitchName, glitchState)
	end
end
addEventHandler("onResourceStart", resourceRoot, toggleGlitches)