-- This could also be a file, with the path provided to svgCreate instead
local rawSvgData = [[
    <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
        <circle cx="250" cy="250" r="250" fill="#0fc0fc" />
    </svg>
]]

local myCircleSvg

local function drawCircleSvg()
    dxDrawImage(0, 0, 500, 500, myCircleSvg, 0, 0, 0, tocolor(255, 255, 255), false)
end

local function init()
    -- Create an SVG containing a circle, using the raw XML data above
    myCircleSvg = svgCreate(500, 500, rawSvgData)
    addEventHandler("onClientRender", root, drawCircleSvg)
end
addEventHandler("onClientResourceStart", resourceRoot, init)