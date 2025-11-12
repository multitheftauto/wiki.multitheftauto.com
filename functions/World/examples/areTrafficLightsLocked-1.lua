function toggleTrafficLights()
    if areTrafficLightsLocked() then -- See if traffic lights are currently locked
	setTrafficLightsLocked(false) -- unlock traffic lights if they are currently locked
    else
	setTrafficLightsLocked(true) -- lock traffic lights if they are not
    end
end
-- add command for toggling traffic lights
addCommandHandler("toggletrafficlights",toggleTrafficLights)