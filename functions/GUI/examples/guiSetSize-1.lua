function changeWindowSize ( )
	--Called by the timer every 2 seconds. It decides an x and y width randomly between .1 and .5
	guiSetSize ( myWindow, ( math.random( 10, 50 ) / 100 ), ( math.random( 10, 50 ) / 100 ), true )
end

--Create a gui window called 'myWindow'
myWindow = guiCreateWindow ( 0.3, 0.3, 0.5, 0.60, "GUI window title", true )
--Set a timer to change the window's size every 2 seconds, infinite times
setTimer ( changeWindowSize, 2000, 0 )