setTimer(
    function()  
	--restarting this resource every hour
        restartResource(getThisResource())
    end,
3600000, 0)