function flashRed()
	-- fade out the local player's camera to red during a second
	fadeCamera(false, 1.0, 255, 0, 0)
	-- set a 500 ms (0.5 sec) timer to fade it back in before it has completely faded out
	setTimer(fadeCamera, 500, 1, true, 1.0)
end
-- we attach our 'flashRed' function to be a handler of "onClientPlayerDamage" when its source (that is, the hit player) is the local player
addEventHandler("onClientPlayerDamage", localPlayer, flashRed)