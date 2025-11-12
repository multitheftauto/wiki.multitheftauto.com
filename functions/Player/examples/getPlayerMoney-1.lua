function checkMoney(thePlayer, command)
	local money = getPlayerMoney(thePlayer)                                -- get the amount of money from the player who entered the command
	if (money > 1000) then                                                 -- if money is more than 1000
		outputChatBox("You are rich: " .. tostring(money), thePlayer)  -- output this message together with the money
 	else
		outputChatBox("Poor guy...", thePlayer)                        -- and else, output this message
	end
end
addCommandHandler("checkMoney", checkMoney)                                    -- add the console command