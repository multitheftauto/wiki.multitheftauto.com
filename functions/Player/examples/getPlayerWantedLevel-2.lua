function outputWantedLevel ()
local wantedLvl = getPlayerWantedLevel ( )
   if wantedLvl == 0 then
      outputChatBox ( "You clean", 0, 255, 0)
   else
      outputChatBox ( "You have "..wantedLvl.." wanted stars!", 255, 0, 0)
   end
end
addCommandHandler ( "wanted", outputWantedLevel )