addEventHandler('onClientResourceStart', resourceRoot,
	function()
		local uSound = playSound3D('http://977music.com/itunes/80s.pls', 2498, -1659, 12) 
		setSoundMaxDistance(uSound, 100)
	end
)