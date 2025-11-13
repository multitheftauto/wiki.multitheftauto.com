local dummies = {
	"light_front_main",
	"light_rear_main",
	"light_front_second",
	"light_rear_second",
	"seat_front",
	"seat_rear",
	"exhaust",
	"engine",
	"gas_cap",
	"trailer_attach",
	"hand_rest",
	"exhaust_second",
	"wing_airtrail",
	"veh_gun"
}
local cache = {}

function move()
	local veh = getPedOccupiedVehicle( localPlayer )
	if not veh then return end

	local model = getElementModel(veh)

	for i,dum in ipairs(dummies) do
		setVehicleModelDummyPosition(model, dum, cache[dum][1], cache[dum][2], cache[dum][3] + math.sin(getTickCount()/1500))
	end
end

addCommandHandler( "move", function()
	local veh = getPedOccupiedVehicle( localPlayer )
	if not veh then return end
	local model = getElementModel(veh)

	for i,dum in ipairs(dummies) do
		local v = {getVehicleModelDummyPosition(model, dum)}
		cache[dum] = v
	end
	addEventHandler("onClientRender", root, move)
end)