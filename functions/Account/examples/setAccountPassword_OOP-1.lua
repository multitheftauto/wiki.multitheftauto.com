function ChangePlayerPassword(player, command, oldpass, newpass)
	-- get the account the player is currently logged into
	local account = player.account
	if (account) then
		-- if its only a guest account, do not allow the password to be changed
		if (account.guest) then
			player:outputChat("You must be logged into an account to change your password.") 
			-- end the function
			return
		end
		
		-- check that the old password is correct
		local password_check = Account(account.new, oldpass)
		if (password_check) then
			-- check the length of the new password
			if (string.len(newpass)>=5) then
				account:setPassword(newpass)
			else
				player:outputChat("Your new password must be at least 5 characters long.")
			end
		else
			player:outputChat("Old password invalid.")
		end
	end
end
addCommandHandler("changepass", ChangePlayerPassword)