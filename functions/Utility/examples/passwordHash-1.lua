-- lets add command handler that will handle the account creation
addCommandHandler("accountCreate",function(source,cmd,username,password)
	if (username and password) then
		local hashedPassword = passwordHash(password,"bcrypt",{}) -- create new hash for password
		if (hashedPassword) then -- check if hash has been generated
			local account = addAccount(username,hashedPassword) -- now lets add account with new hash what we got when we made it for password.
			if (account) then
				setAccountData(account,"hash_password",hashedPassword) -- store accounts password hash in order to verify it when it's needed.
				outputChatBox("Account successfuly created! Now please login. Syntax </accountLogin [username] [password]>",source,20,160,20)
			else
				outputChatBox("Account already exists! Please try again with different username.",source,20,160,20)
			end
		else
			outputChatBox("Securing your password failed! Please try again or contact an administrator.",source,160,20,20)
		end
	else
		outputChatBox("Wrong parameters! Correct Syntax </accountCreate [username] [password]>",source,160,20,20)
	end
end);

-- lets add command handler that will handle the account login
addCommandHandler("accountLogin",function(source,cmd,username,password)
	if (username and password) then
		local account = getAccount(username) -- get entered account
		if (account) then -- check if entered account exists
			local hashedPassword = getAccountData(account,"hash_password") -- lets get hashed password
			if (passwordVerify(password,hashedPassword)) then -- check if hash and entered password matches
				if logIn(source,account,hashedPassword) then -- now lets login player into account
					outputChatBox("Login successfull. Welcome, "..getAccountName(account).."!",source,20,160,20)
				end
			else
				outputChatBox("Password is incorrect!",source,160,20,20)
			end
		else
			outputChatBox("Account doesn't exist! Please try again with different account.",source,160,20,20)
		end
	else
		outputChatBox("Wrong parameters! Correct Syntax </accountLogin [username] [password]>",source,160,20,20)
	end
end);