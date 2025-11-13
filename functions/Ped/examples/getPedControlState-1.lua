local controlTable = {"forwards", "backwards", "left", "right", "jump", "crouch"}

function invisibleOnSpawn()
    setElementAlpha (localPlayer, 0)
    checkControlState = setTimer(controlState, 50, 0)
end
addEventHandler ("onClientPlayerSpawn", localPlayer, invisibleOnSpawn)

function controlState()
    for i,control in ipairs(controlTable) do
        local state = getPedControlState(localPlayer, control)
	if (state) then
	    setElementAlpha (localPlayer, 255)
	    if (isTimer(checkControlState)) then
		killTimer(checkControlState)
		checkControlState = nil
	    end 
	end
    end
end