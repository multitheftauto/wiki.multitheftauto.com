local screenX, screenY = guiGetScreenSize() -- get the screen resolution (width and height)
local textColor = tocolor(255, 255, 255, 255) -- define color outside render scope and use it afterwards (for performance reasons)

function renderGameTick()
    local tickNow = getTickCount()

    dxDrawText(tickNow, 44, screenY - 43, screenX, screenY, textColor, 1, 2, "pricedown")
end
addEventHandler("onClientRender", root, renderGameTick)