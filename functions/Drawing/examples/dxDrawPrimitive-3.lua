local screenSizeX,screenSizeY = guiGetScreenSize() -- save the current screen dimensions
local circleCoords = {}
local resolution = 100 -- resolution in this example means in how many steps we draw the linestrip, higher resolution means smoother curve at the expense of longer computation time and higher memory usage
local scale = 20
local maxSegmentPercentage = 0.75 -- this means the largest our line will get is 3/4 of the full circle
local startPointRevolution = 2000 -- one full revolution around the circle for our starting point after this amount of milliseconds passed
local endPointOscillation = 3000 -- one full oscillation of our endpoint after this amount of milliseconds passed

function resStart() -- do all this once during "onClientResourceStart", rather than every frame
	local range = math.pi * 2 -- to complete a circle we need the range from 0 to 2pi
	for i=0,range,range/resolution do -- "loop through this [resolution] times, starting at 0 and ending at [range]"
		local x = screenSizeX * 0.5 + math.sin(i) * scale -- for a circle we get our x coordiante from sine and the y coordinate from cosine or vice versa
		local y = screenSizeY * 0.5 - math.cos(i) * scale -- subtract will later result in a clockwise spin, add in a counter clockwise one
		table.insert(circleCoords,{x,y})
	end
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()), resStart)

function exampleRender()
	local tick = getTickCount() -- get the current time in milliseconds, then use it in a few clever ways to animate our circle
	local firstPoint = math.ceil( ((tick/startPointRevolution) % 1)*resolution ) -- firstly dividing it and using %1 (modulo 1) to repeatedly get a slowly, linearly increasing value from 0 to 1. This is our starting point
	local secondPoint = math.ceil( firstPoint + (math.sin(tick/endPointOscillation)) * resolution*maxSegmentPercentage ) -- secondly figuring out where we want our end point to be, using sine to get a pleasant looking pulse for the line growth
	
	if firstPoint > secondPoint then -- because of how we calculate our end point, half the time it will be smaller than the start point. for unpack() to give us the range we want we need to provide the smaller value first
		firstPoint, secondPoint = secondPoint, firstPoint
	end
	
	if secondPoint > resolution then -- sometimes we'll wrap around the origin point of our circle, those cases need to be taken care of, so we'll draw the linestrip in two parts for those.
		dxDrawPrimitive("linestrip",true,unpack(circleCoords,firstPoint,resolution)) -- [secondPoint] is overshooting, so first let's complete the circle from [firstPoint]
		dxDrawPrimitive("linestrip",true,circleCoords[resolution],unpack(circleCoords,1,secondPoint%resolution)) -- and then draw the remaining extra segments from the start of the circle to however many segments [secondPoint] went past [resolution]
	elseif firstPoint < 1 then -- lua tables start at an index of 1, so 0 and anything into the negatives needs to be handled
		dxDrawPrimitive("linestrip",true,unpack(circleCoords,resolution+firstPoint,resolution)) -- "how many segments before [resolution] do we have to start? Either way we complete it at [resolution]!"
		dxDrawPrimitive("linestrip",true,circleCoords[resolution],unpack(circleCoords,1,secondPoint)) -- draw the remaining segments from 1 all the way to [secondPoint]
	else
		dxDrawPrimitive("linestrip",true,unpack(circleCoords,firstPoint,secondPoint)) -- the line isn't currently crossing the origin point of the circle at the top, so drawing this one is straight forwards
	end

end
addEventHandler("onClientRender",getRootElement(),exampleRender)