local function setMyPosition(player, _, position)
	-- grab the vehicle, if it exists
	local veh = player.vehicle

	-- make sure we're actually in a vehicle
	if not veh then
		player:outputChat("You are not in a vehicle!")
		return
	end

	-- make sure we're in a train
	if veh.vehicleType ~= "Train" then
		player:outputChat("You are not in a train!")
		return
	end

	-- convert position to a number
	position = tonumber(position)

	-- if position cannot be converted to a number
	if not position then
		player:outputChat("Syntax: /settrainpos <position>")
		return
	end

	-- finally set the train position
	veh.trainPosition = position
end
addCommandHandler("settrainpos", setMyPosition)