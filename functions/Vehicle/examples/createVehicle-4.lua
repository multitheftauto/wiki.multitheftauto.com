-- Do not allow the following IDs to be spawned
local forbiddenCars = { [435] = true, [441] = true, [449] = true, [450] = true, [464] = true, [465] = true, [501] = true,
                        [537] = true, [538] = true, [564] = true, [569] = true, [570] = true, [584] = true, [590] = true,
                        [591] = true, [594] = true, [606] = true, [607] = true, [608] = true, [610] = true, [611] = true }

local cmdVehRoot = createElement("commandVehicles") -- Dummy element containing the cars that this command has created
addCommandHandler("spveh",
    function(player, cmd, modelID, x, y, z, platetext)
        -- Check whether arguments are correct
        local modelID, x, y, z = tonumber(modelID), tonumber(x), tonumber(y), tonumber(z)
        if modelID and x and y and z then
            -- Do not continue if we shouldn't
            if forbiddenCars[modelID] then
                outputChatBox("The car model you provided is not allowed.", player, 255, 0, 0)
                return
            end
            local platetext = type(platetext) == "string" and platetext or "PRIVATE"
            -- Create the actual vehicle and set it as a children of our dummy element
            setElementParent(createVehicle(modelID, x, y, z, 0, 0, 0, platetext), cmdVehRoot)
            -- Inform the player about what we did
            outputChatBox("You have created a " .. getVehicleNameFromModel(modelID) .. " (model ID: " .. modelID .. ") at " .. table.concat({ x, y, z }, ", ") .. " with numberplate " .. platetext .. " successfully.", player, 0, 255, 0)
        else
            outputChatBox("Syntax: /" .. cmd .. " (modelID) (x) (y) (z) [numberplate]", player, 255, 255, 255)
        end
    end
)

-- If a vehicle that has been created using the command blows up, respawn it where it was created
addEventHandler("onVehicleExplode", cmdVehRoot,
    function()
        respawnVehicle(source)
    end
)