-- OPTIONS --
local debugMode = true -- If true, the script will draw the vectors used to compute the effect

-- EFFECT CONTROL FUNCTIONS --
local playerVehicle, lightMarker, light
local function applyDrivingLightEffect()
    -- Get the vehicle matrix and use it to get the vehicle and vehicle base position
    local vehicleMatrix = playerVehicle.matrix
    local vehiclePosition = vehicleMatrix:getPosition()
    -- Get the vehicle upwards vector and vehicle forward direction vector
    local vehicleUpwardsVector, vehicleForwardVector = vehicleMatrix:getUp(), vehicleMatrix:getForward()
    -- Get the normalized cross product of the vehicle forward vector and the vehicleUpwardsVector vector
    local crossVector = vehicleForwardVector:cross(vehicleUpwardsVector):getNormalized()
    -- Draw all the interesting vectors we have now
    if debugMode then
        local forwardPoint = vehiclePosition + vehicleForwardVector
        dxDrawLine3D(vehiclePosition, forwardPoint, tocolor(255, 0, 0))
        local sx, sy = getScreenFromWorldPosition(forwardPoint)
        if sx then
            dxDrawText("F", sx, sy)
        end
            
        local vehicleUpwardsVectorPoint = vehiclePosition + vehicleUpwardsVector
        dxDrawLine3D(vehiclePosition, vehicleUpwardsVectorPoint, tocolor(0, 255, 0))
        local sx, sy = getScreenFromWorldPosition(vehicleUpwardsVectorPoint, 1.1)
        if sx then
            dxDrawText("U", sx, sy)
        end
          
        local crossPoint = vehiclePosition + crossVector
        dxDrawLine3D(vehiclePosition, crossPoint, tocolor(0, 0, 255))
        local sx, sy = getScreenFromWorldPosition(crossPoint)
        if sx then
            dxDrawText("C", sx, sy)
        end
    end
    -- Calculate the half length of the vehicle based in its bounding box, and use it to position the light effects at the right
    local _, bmy, _, _, bMy = playerVehicle:getBoundingBox()
    local newEffectPosition = vehiclePosition + crossVector * (bMy - bmy) / 2
    lightMarker.position = newEffectPosition
    light.position = newEffectPosition
end

local function startDrivingLightEffect()
    -- Create the effects and start updating them every frame
    addEventHandler("onClientPreRender", root, applyDrivingLightEffect)
    playerVehicle, lightMarker, light = localPlayer.vehicle, createMarker(0, 0, 0, "corona", 0.5, 255, 255, 0), createLight(0, 0, 0, 0, 8, 255, 255)
    -- If we are in debug mode, render the vehicle invisible to see the vectors clearly
    if debugMode then
        playerVehicle.alpha = 0
    end
end

local function stopDrivingLightEffect()
    -- Stop applyDrivingLightEffect from being called and destroy everything created
    removeEventHandler("onClientPreRender", root, applyDrivingLightEffect)
    destroyElement(lightMarker)
    destroyElement(light)
    -- If we are in debug mode, reset the vehicle alpha to normal again
    if debugMode then
        playerVehicle.alpha = 255
    end
    playerVehicle, lightMarker, light = nil, nil, nil
end

-- FUNCTIONS THAT MANAGE THE EFFECT --
-- Start or stop the effect when the player is driving a car
local function manageDrivingLightEffectStatus(_, seat)
    if eventName == "onClientPlayerVehicleEnter" then
        if seat == 0 then
            -- The player has just entered a vehicle as the driver. Start the effect
            startDrivingLightEffect()
        end
    elseif playerVehicle then
        -- The player has just exited a vehicle and we were applying the effect. Stop it
        stopDrivingLightEffect()
    end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, manageDrivingLightEffectStatus)
addEventHandler("onClientPlayerVehicleExit", localPlayer, manageDrivingLightEffectStatus)

-- Start the effect when the resource starts if the player is driving a vehicle, and reset vehicle alpha back to normal if necessary
local function handleResourceStartStop()
    if eventName == "onClientResourceStart" then
        playerVehicle = localPlayer.vehicle or nil
        if playerVehicle then
            startDrivingLightEffect()
        end
    elseif playerVehicle then
        -- It is not necessary to call this function to just reset the car alpha, but it is a good practise to ALWAYS clean up everything nevertheless
        stopDrivingLightEffect()
    end
end
addEventHandler("onClientResourceStart", resourceRoot, handleResourceStartStop)
addEventHandler("onClientResourceStop", resourceRoot, handleResourceStartStop)