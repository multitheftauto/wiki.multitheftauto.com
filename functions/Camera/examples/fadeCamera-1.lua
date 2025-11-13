function addRednessOnDamage ( )
      fadeCamera ( source, false, 1.0, 255, 0, 0 )         -- fade the player's camera to red over a period of 1 second
      setTimer ( fadeCameraDelayed, 500, 1, source )   -- don't let it go to opaque red, interrupt it after half a second and fade back to normal
end
addEventHandler ( "onPlayerDamage", root, addRednessOnDamage )

function fadeCameraDelayed(player) -- This function prevents debug warnings when the player disconnects while the timer is running.
      if (isElement(player)) then
            fadeCamera(player, true, 0.5)
      end
end