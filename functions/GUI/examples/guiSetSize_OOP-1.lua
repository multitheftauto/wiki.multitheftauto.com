local screenX, screenY = GuiElement.getScreenSize()
local window
local startTick
local widthFrom, widthTo, heightFrom, heightTo = 0, 0, 0, 0
local showing = false

local function animWindow()
    if (not startTick) then
        return
    end

    local progress = (getTickCount() - startTick) / 500
    local w, h = interpolateBetween(widthFrom, heightFrom, 0, widthTo, heightTo, 0, progress, 'Linear')

    if (isElement(window)) then
        window:setSize(w, h, true)
    end

    if (progress > 1) then
        removeEventHandler('onClientRender', root, animWindow)
        startTick = nil

        if (h <= 0 or w <= 0) then
            window:destroy()
        end
    end
end

local function toggleWindow()
    if (startTick) then
        return
    end

    if (not isElement(window)) then
        window = GuiWindow(0.5, 0.5, 0, 0, 'Window', true)
    end

    showing = not showing

    startTick = getTickCount()
    local currW, currH = window:getSize(true)
    widthFrom = showing and 0 or currW
    widthTo = showing and 0.2 or 0
    heightFrom = showing and 0 or currH
    heightTo = showing and 0.25 or 0

    addEventHandler('onClientRender', root, animWindow)
end
bindKey('m', 'down', toggleWindow)