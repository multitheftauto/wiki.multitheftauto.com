local window = guiCreateWindow(0.3,0.3,0.3,0.3,"Scroll-Position",true)
local scroll_bar = guiCreateScrollBar(5,25,30,245,false,false,window)

function scroll_bar_setPos(_,position)
	if (tonumber(position)) then -- If we have typed a position
		guiScrollBarSetScrollPosition(scroll_bar,position) --Set the position in the scroll bar
	end
end
addCommandHandler("pos",scroll_bar_setPos)