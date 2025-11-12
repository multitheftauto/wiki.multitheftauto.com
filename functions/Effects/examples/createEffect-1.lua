local effectSwitchUpKey = "mouse_wheel_up"
local effectSwitchDownKey = "mouse_wheel_down"
local effectCreateKey = "b"

local effectNames = {
	"blood_heli", "boat_prop", "camflash", "carwashspray", "cement", "cloudfast", "coke_puff", "coke_trail", "cigarette_smoke",
	"explosion_barrel", "explosion_crate", "explosion_door", "exhale", "explosion_fuel_car", "explosion_large", "explosion_medium",
	"explosion_molotov", "explosion_small", "explosion_tiny", "extinguisher", "flame", "fire", "fire_med", "fire_large", "flamethrower",
	"fire_bike", "fire_car", "gunflash", "gunsmoke", "insects", "heli_dust", "jetpack", "jetthrust", "nitro", "molotov_flame",
	"overheat_car", "overheat_car_electric", "prt_blood", "prt_boatsplash", "prt_bubble", "prt_cardebris", "prt_collisionsmoke",
	"prt_glass", "prt_gunshell", "prt_sand", "prt_sand2", "prt_smokeII_3_expand", "prt_smoke_huge", "prt_spark", "prt_spark_2",
	"prt_splash", "prt_wake", "prt_watersplash", "prt_wheeldirt", "petrolcan", "puke", "riot_smoke", "spraycan", "smoke30lit", "smoke30m",
	"smoke50lit", "shootlight", "smoke_flare", "tank_fire", "teargas", "teargasAD", "tree_hit_fir", "tree_hit_palm", "vent", "vent2",
	"water_hydrant", "water_ripples", "water_speed", "water_splash", "water_splash_big", "water_splsh_sml", "water_swim", "waterfall_end",
	"water_fnt_tme", "water_fountain", "wallbust", "WS_factorysmoke"
}

local effectID = 1
local effectName = effectNames[effectID]
local effectCount = (#effectNames) -- there are 82 effects

outputChatBox("Effect set to: #ffa500"..effectName.."#ffffff (ID: #ffa500"..effectID.."#ffffff)", 255, 255, 255, true)

local function createEffectManually()
	local playerX, playerY, playerZ = getElementPosition(localPlayer)
	local effectX, effectY, effectZ = playerX, playerY, (playerZ + 2)
	local effectRX, effectRY, effectRZ = 0, 0, 0
	local effectDrawDistance = 300
	local effectSoundEnable = false

	outputChatBox("Created effect: #ffa500"..effectName.."#ffffff (ID: #ffa500"..effectID.."#ffffff)", 255, 255, 255, true)
	createEffect(effectName, effectX, effectY, effectZ, effectRX, effectRY, effectRZ, effectDrawDistance, effectSoundEnable)
end
bindKey(effectCreateKey, "down", createEffectManually)

local function switchEffect(keyName)
	local effectSwitchUp = (keyName == effectSwitchUpKey)
	local effectSwitchFactor = (effectSwitchUp and 1 or -1)
	local effectSwitchTempID = (effectID + effectSwitchFactor)
	local effectSwitchID = (effectSwitchTempID > effectCount and 1 or effectSwitchTempID < 1 and effectCount or effectSwitchTempID)

	effectID = effectSwitchID
	effectName = effectNames[effectID]

	outputChatBox("Effect set to: #ffa500"..effectName.."#ffffff (ID: #ffa500"..effectID.."#ffffff)", 255, 255, 255, true)
end
bindKey(effectSwitchDownKey, "down", switchEffect)
bindKey(effectSwitchUpKey, "down", switchEffect)