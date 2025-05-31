--First, we create a function for the event handler to use.
function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )
    if weapon == 38 and getElementType(hitElement)=="player" then -- If the player shoots with a minigun, and hits another player...
         outputChatBox ( "Don't kill people with minigun, it's lame!", 255, 0, 0 ) -- We output a warning to him.
    end
end
-- Add this as a handler so that the function will be triggered every time the local player fires.
addEventHandler ( "onClientPlayerWeaponFire", localPlayer, onClientPlayerWeaponFireFunc )