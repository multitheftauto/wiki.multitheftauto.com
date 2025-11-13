players = getElementsByType ( "player" )
admins = ""
for k,v in ipairs(players) do
   local accountname = ""
   if (isGuestAccount(getPlayerAccount(v)) == false) then
      accountname = getAccountName (getPlayerAccount(v))
      if isObjectInACLGroup ( "user." .. accountname, aclGetGroup ( "admin" ) ) then
         if (admins == "") then
            admins = getPlayerName(v)
         else
            admins = admins .. ", " .. getPlayerName(v)
         end
      end
   end
end
outputChatBox( "Online Admins:", getRootElement(), 255, 255, 0)
outputChatBox( " " .. tostring ( admins ), getRootElement(), 255, 255, 0)