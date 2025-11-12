function takeCash ( thePlayer, command, amount )     -- when the takecash command is called
     takePlayerMoney ( thePlayer, tonumber(amount) ) -- take the amount of money from the player
end
addCommandHandler ( "takecash", takeCash )           -- add a handler function for the command "takecash"