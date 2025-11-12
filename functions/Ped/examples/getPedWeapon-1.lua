-- Find a player called someguy and find his current weapon id.
local weaponType = getPedWeapon ( getRandomPlayer() )
-- If a weapon type was returned then
if ( weaponType ) then
    outputChatBox ( "someguy's current Weapon-type: " .. weaponType .. "." ) -- Display the weapon type in the chat box
end