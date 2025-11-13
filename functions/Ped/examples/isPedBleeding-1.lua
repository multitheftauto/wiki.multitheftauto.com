function checkBleeding ()
   if isPedBleeding (localPlayer) then
      outputChatBox ("The ped is bleeding!")
   else
      outputChatBox ("The ped is not bleeding!")
   end
end

addCommandHandler ("checkbleed", checkBleeding)