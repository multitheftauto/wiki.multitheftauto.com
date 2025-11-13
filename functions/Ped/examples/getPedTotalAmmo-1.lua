-- Find the player called 'Someguy'
myPlayer = getPlayerFromName ( "Someguy" )
-- If a player called 'Someguy' was found then
if ( myPlayer ) then
	-- Retrieve the total amount of ammo for that player, and store it in a variable called 'ammo'
	ammo = getPedTotalAmmo ( myPlayer )
	-- Tell all the players how much ammo 'Someguy' has
	outputChatBox ( "Someguy's current total ammo: " .. ammo .. "." )
end