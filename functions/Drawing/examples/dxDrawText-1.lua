local screenX, screenY = guiGetScreenSize() -- get the screen resolution (width and height)
local shadowColor = tocolor(0, 0, 0, 255) -- define shadow color outside render scope and use it afterwards (for performance reasons)
local textColor = tocolor(255, 255, 255, 255) -- define color outside render scope and use it afterwards (for performance reasons)

function renderPlayerZone()
    local playerX, playerY, playerZ = getElementPosition(localPlayer) -- get our player's coordinates
    local playerZoneName = getZoneName(playerX, playerY, playerZ) -- get name of the zone the player is in

    -- draw zone name text's shadow
    dxDrawText(playerZoneName, 44, screenY - 41, screenX, screenY, shadowColor, 1.02, "pricedown")
    -- draw zone name text
    dxDrawText(playerZoneName, 44, screenY - 43, screenX, screenY, textColor, 1, "pricedown")
end
addEventHandler("onClientRender", root, renderPlayerZone)