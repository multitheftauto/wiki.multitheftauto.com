--setup a function when the resource starts
function checkResolutionOnStart ()
	local x,y = guiGetScreenSize() --get their screen size
	if ( x <= 640 ) and ( y <= 480 ) then --if their resolution is lower or equal to 640x480
		--warn them about GUI problems.
		outputChatBox ( "WARNING: You are running on a low resolution.  Some GUI may be placed or appear incorrectly." )
	end
end
--attach the function to the event handler
addEventHandler ( "onClientResourceStart", resourceRoot, checkResolutionOnStart )