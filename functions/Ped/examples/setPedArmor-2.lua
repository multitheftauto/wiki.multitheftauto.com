function givePlayerArmor( player, command, amount )
   if getPedArmor(player) == 100 then
      outputChatBox("Your armor already is complete!", player, 220, 0, 0 ) -- Inform the player if your armor already is complete.
      return
   end

   if amount and tonumber(amount) >= 1 or tonumber(amount) <= 100 then -- If amount is between 1 and 100.
      setPedArmor(player, tonumber(amount))    -- Set amount armor that player chosen on the command.
   else
      outputChatBox( "Syntax: /addarmor [armor-amount] the amount should be between 1 and 100", player, 220, 0, 0 ) -- Inform the player if 'amount' argument is missing.
   end
end
addCommandHandler( "addarmor", givePlayerArmor )