function giveWeapons(player, weaponsString)
	local weaponsTable = split(weaponsString, ';') --split the string by the semi colon
	for k,v in ipairs(weaponsTable) do --for all the split values do
		weaponId = gettok(v, 1, string.byte(',')) --get the weapon ID using gettok, retrieve the first token
		weaponAmmo = gettok(v, 2, ",") --get the ammo using gettok, retrieve the second token
		if (weaponId and weaponAmmo) then --if neither of them is invalid
			giveWeapon(player, weaponId, weaponAmmo) --give the player the weapons
		end
	end
end