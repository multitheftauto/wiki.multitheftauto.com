local worldSpecialProperties = {
	["hovercars"] = false,
	["aircars"] = false,
	["extrabunny"] = false,
	["extrajump"] = false,
	["randomfoliage"] = true,
	["snipermoon"] = false,
	["extraairresistance"] = true,
	["underworldwarp"] = true,
	["vehiclesunglare"] = false,
	["coronaztest"] = true,
	["watercreatures"] = true,
	["burnflippedcars"] = true,
	["fireballdestruct"] = true,
	["roadsignstext"] = true,
	["extendedwatercannons"] = true,
	["tunnelweatherblend"] = true,
	["ignorefirestate"] = false,
	["flyingcomponents"] = true,
	["vehicleburnexplosions"] = true,
	["vehicle_engine_autostart"] = true,
}

local function toggleWorldSpecialProperties()
	for propertyName, propertyState in pairs(worldSpecialProperties) do
		setWorldSpecialPropertyEnabled(propertyName, propertyState)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, toggleWorldSpecialProperties)