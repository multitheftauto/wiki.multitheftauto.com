function dontAllowAnyOpenWindow ()
	if isMTAWindowActive ()	then
		 setElementHealth ( getLocalPlayer(), 0.0 )
	end	 
end
setTimer ( dontAllowAnyOpenWindow, 50, 0 )