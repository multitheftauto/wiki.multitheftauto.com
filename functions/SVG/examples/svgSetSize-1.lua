-- This could also be a file, with the path provided to svgCreate instead
local rawSvgData = [[
    <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
        <circle cx="250" cy="250" r="250" fill="#0fc0fc" />
    </svg>
]]

local svgs = {}

local function render(svg)
    if (not isElement(svg)) or (getElementType(svg) ~= "svg") then
        removeEventHandler("onClientRender", root, svgs[svg].handler)
        svgs[svg] = nil
    end

    local width, height = svgGetSize(svg)
    dxDrawImage(0, 0, width, height, svg, 0, 0, 0, tocolor(255, 255, 255), false)
end

local function onUpdate(svg)
    -- If this is the first update, add svg to our table and start drawing it
    if (not svgs[svg]) then
        svgs[svg] = {
            state = true,
            handler = function()
                render(svg)
            end
        }

        addEventHandler("onClientRender", root, svgs[svg].handler)
    end

    iprint("SVG texture updated", svg, getTickCount())
end

local function init()
    -- Create an SVG containing a circle, using the raw XML data above
    local mySvg = svgCreate(500, 500, rawSvgData, onUpdate)

    -- Bind a key to set SVG to a random size, which will trigger the onUpdate callback
    bindKey("F2", "down", function()
        setRandomSVGSize(mySvg)
    end)
end
addEventHandler("onClientResourceStart", resourceRoot, init)

function setRandomSVGSize(svg)
    local width, height = svgGetSize(svg)
    local diff = math.min(width, height) /  math.max(width, height)
    local size = math.random(100, 500)

    svgSetSize(svg, size, size * diff)
end