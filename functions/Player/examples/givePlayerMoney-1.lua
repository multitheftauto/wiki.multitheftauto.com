function consoleGiveCash ( thePlayer, command, amount ) --when the givecash command is called
	givePlayerMoney ( thePlayer, amount ) --give the player money according to the amount
end
addCommandHandler ( "givecash", consoleGiveCash  ) --add a handler function for the command "givecash"