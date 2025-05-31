addEventHandler( "onPlayerWasted", root,
	function()
		setTimer( spawnPlayer, 2000, 1, source, 0, 0, 3 )
	end
)