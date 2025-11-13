-- this example looks if there is a ban with nick 'Steve', and if there is, it changes ban nick to 'Mike'
local function changeBanNick()
   for i,ban in pairs(Ban.getList()) do
      if (ban.nick == "Steve") then
         ban.nick = "Mike"
      end
   end
end
addCommandHandler("setbannick",changeBanNick)