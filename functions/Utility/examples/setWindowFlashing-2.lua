addCommandHandler("flash",
	function(_, wait, count)
		wait = tonumber(wait) -- makes "wait" a number, this will be false if it can't be converted
		shouldFlash = type(wait) == "number" -- if wait is given, we should flash, otherwise we shouldn't
		wait = wait or 5-- make wait default to 1 second if it isn't a number
		count = tonumber(count) or 5 -- makes "count" a number, 5 if it can't be converted

		setTimer(setWindowFlashing, wait*1000, 1, shouldFlash, count)
	end
)