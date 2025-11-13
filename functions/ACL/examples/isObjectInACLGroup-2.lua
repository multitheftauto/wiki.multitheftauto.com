addCommandHandler("admins", function(plr, cmd)
   local admins = ""
   for k,v in ipairs(getElementsByType("player")) do
      local account = getPlayerAccount(v)
      if (account and not isGuestAccount(account)) then
         if (isObjectInACLGroup("user."..getAccountName(account), aclGetGroup("Admin"))) then
            if (admins == "") then
               admins = getPlayerName(v)
            else
               admins = admins..", "..getPlayerName(v)
            end
         end
      end
   end

   outputChatBox("Online admins: ", plr, 255, 255, 0)
   outputChatBox(admins, plr, 255, 255, 0)
end)