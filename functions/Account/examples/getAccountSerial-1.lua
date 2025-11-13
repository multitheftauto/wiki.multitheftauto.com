addCommandHandler("getaccserial", 
   function (player, cmd, accountName)
      if accountName then 
	 local account = getAccount(accountName)
	 if (account) then
	     outputChatBox("Serial: " .. getAccountSerial(account))
	 else
	     outputChatBox("Account not found")
	 end
     end
 end
)