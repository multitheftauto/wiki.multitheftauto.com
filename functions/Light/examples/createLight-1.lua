local lightRadius = 2 * getElementRadius(localPlayer) -- Every standard player model has the same radius, so save it for quicker access
local lights = { [localPlayer] = createLight(2, 0, 0, 0, lightRadius) } -- Initialize our light table with the one that the local player will use for the effect

local function addPlayerDarkLight()
    -- Create a new dark light for that player
    lights[source] = createLight(2, 0, 0, 0, lightRadius)
end
addEventHandler("onClientPlayerJoin", root, addPlayerDarkLight)

local function removePlayerDarkLight()
    -- Destroy the light of that player and remove references
    destroyElement(lights[source])
    lights[source] = nil
end
addEventHandler("onClientPlayerQuit", root, removePlayerDarkLight)

-- Make the dark light assigned to each player to move with his center, so we achieve the desired effect
local function updateLightPositions()
    for player, light in pairs(lights) do
        if isElementStreamedIn(player) then
           setElementPosition(light, getPedBonePosition(player, 2))
        end
    end
end
addEventHandler("onClientPreRender", root, updateLightPositions)