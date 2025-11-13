function armor (player, command)
   if command == "addarmor" then 
      setPedArmor ( player, 100 )    -- Set player's armor to 100 when he types the command 'addarmor'
   elseif command == "removearmor" then 
      setPedArmor ( player, 0 )      -- Set player's armor to 0 when he types the command 'removearmor'
   end 
end
addCommandHandler ("addarmor", armor)
addCommandHandler ("removearmor", armor)