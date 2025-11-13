addCommandHandler("flash",
	function()
		setTimer(setWindowFlashing, 1000, 1, true, 3)
	end
)