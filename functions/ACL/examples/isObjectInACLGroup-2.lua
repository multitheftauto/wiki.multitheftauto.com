local admins = ""
local players = getElementsByType("player")
for k, v in ipairs(players) do
   if not isGuestAccount(getPlayerAccount(v)) then
      local accountName = getAccountName(getPlayerAccount(v))
      if isObjectInACLGroup("user." .. accountName, aclGetGroup("Admin")) then
         if admins == "" then
            admins = getPlayerName(v)
         else
            admins = admins .. ", " .. getPlayerName(v)
         end
      end
   end
end
outputChatBox("Online Admins:", getRootElement(), 255, 255, 0)
outputChatBox(" " .. admins, getRootElement(), 255, 255, 0)