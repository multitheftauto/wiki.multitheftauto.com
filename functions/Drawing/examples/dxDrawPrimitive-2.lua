local screenSizeX,screenSizeY = guiGetScreenSize() -- save the current screen dimensions
local sinCoords = {}

function resStart() -- do all this once during "onClientResourceStart", rather than every frame
	local range = math.pi * 2 -- to get 1 complete oscillation of the sine wave we need the range from 0 to 2pi
	local resolution = 100 -- resolution in this example means in how many steps we draw the linestrip, higher resolution means smoother curve at the expense of longer computation time and higher memory usage
	local scale = 50
	for i=0,range,range/resolution do -- "loop through this [resolution] times, starting at 0 and ending at [range]"
		local x = screenSizeX * 0.5 + i * scale -- start at the center of the screen and go from there
		local y = screenSizeY * 0.5 - math.sin(i) * scale -- subtract rather than add because greater y value means lower on the screen, which is the opposite of what we're used to seeing in graphs
		table.insert(sinCoords,{x,y})
	end
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()), resStart)

function exampleRender()
	dxDrawPrimitive("linestrip",true,unpack(sinCoords)) -- render a linestrip type primitive with the coordinates we calculated earlier to draw our sine wave
end
addEventHandler("onClientRender",getRootElement(),exampleRender)