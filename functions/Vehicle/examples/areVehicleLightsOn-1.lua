addCommandHandler('checkMyLights' , function ()
if not isPedInVehicle(localPlayer) then
outputChatBox('Please enter your vehicle first' , 150 , 50 , 0 )
return end
local message = ''
local myVehicle = getPedOccupiedVehicle(localPlayer)
local checkIfOverrided = getVehicleOverrideLights(myVehicle)
	if checkIfOverrided == 0 then
		if areVehicleLightsOn(myVehicle) then
			local h , m = getTime()
			if h > 6 and h < 20 then
				message = 'on. Reason: You are in a dark place' -- vehicle lights turn on in some dark places during the day like this position   x:-1513  y:-287  z:6
			else
				message = 'on. Reason: It is night'
			end
		else
			message = 'off. Reason: It is day'
		end
	elseif checkIfOverrided == 1 then
		message = 'off. Reason: They are forced off'
	else
		message = 'on. Reason: They are forced on'
	end
	
outputChatBox('Your vehicle lights are turned '..message , 0 , 150 , 50 )
end)