local screenX, screenY = GuiElement.getScreenSize()
local window
local startTick
local animFrom, animTo = 0, 0
local showing = false

local function animWindow()
    if (not startTick) then
        return
    end

    local progress = (getTickCount() - startTick) / 500
    local y = interpolateBetween(animFrom, 0, 0, animTo, 0, 0, progress, 'Linear')

    if (isElement(window)) then
        window:setPosition(0.5, y, true)
    end

    if (progress > 1) then
        removeEventHandler('onClientRender', root, animWindow)
        startTick = nil

        if (y >= 1) then
            window:destroy()
        end
    end
end

local function toggleWindow()
    if (startTick) then
        return
    end

    if (not isElement(window)) then
        window = GuiWindow(0.5, 1, 0.1, 0.15, 'Window', true)
    end

    showing = not showing

    startTick = getTickCount()
    animFrom = showing and 1 or select(2, window:getPosition(true))
    animTo = showing and 0.5 or 1

    addEventHandler('onClientRender', root, animWindow)
end
bindKey('m', 'down', toggleWindow)