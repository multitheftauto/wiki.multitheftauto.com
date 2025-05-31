function onStealthKill(targetPlayer)
     cancelEvent(true, "No more stealth kills.") -- Aborts the stealth-kill.
end
addEventHandler("onPlayerStealthKill", root, onStealthKill) -- Adds a handler for the stealth kill event.