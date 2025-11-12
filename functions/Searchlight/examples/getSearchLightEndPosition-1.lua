local helmetLantern

local function updateHelmetLantern()
    local helmetPos, playerMatrix = Vector3(getPedBonePosition(localPlayer, 6)), getElementMatrix(localPlayer)
    local targetPos = Vector3(playerMatrix[4][1] + playerMatrix[2][1] * 3, playerMatrix[4][2] + playerMatrix[2][2] * 3, playerMatrix[4][3] + playerMatrix[2][3] * 3)
    -- If the searchlight we use for the effect doesn't exist, create it
    -- If it is already created, then simply update its start and end positions
    if not helmetLantern then
        helmetLantern = createSearchLight(helmetPos, targetPos, 0, 15)
		local a , b = getSearchLightEndPosition(helmetLantern)
		outputChatBox(a .." "..b)
    else
        setSearchLightStartPosition(helmetLantern, helmetPos)
        setSearchLightEndPosition(helmetLantern, targetPos)
    end
end

local function manageHelmetLantern()
    local helmetLanternOff = not helmetLantern
    playSoundFrontEnd(helmetLanternOff and 37 or 38)
    if helmetLanternOff then
        -- Let updateHelmetLantern take care of creating and updating the effect
        addEventHandler("onClientPreRender", root, updateHelmetLantern)
    else
        -- Stop updateHelmetLantern doing its job and clear variables
        removeEventHandler("onClientPreRender", root, updateHelmetLantern)
        destroyElement(helmetLantern)
        helmetLantern = nil
    end
end

-- Allow the player to turn the helmet lantern or on off by using /togglelantern or pressing O
addCommandHandler("togglelantern", manageHelmetLantern)
bindKey("o", "down", manageHelmetLantern)