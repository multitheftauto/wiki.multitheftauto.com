-- this example looks if there is a ban with nick 'Steve', and if there is, it changes ban nick to 'Mike'
function changeBanNick()
   for i,ban in pairs(getBans()) do
      if getBanNick(ban) == "Steve" then
         setBanNick(ban,"Mike")
      end
   end
end
addCommandHandler("setbannick",changeBanNick)