function makeBlipHigher(thePlayer)
    local setmeup = createBlipAttachedTo ( thePlayer, 3, 3, 255, 0,0,255,0,99999.0, root)
    setBlipOrdering(setmeup, getBlipOrdering(setmeup) + 1)
    outputChatBox("*INFO: #ffff00Your blip is now on top of others!", thePlayer, 255,0,0,true)
    for i,v in ipairs(getElementsByType"player") do
          if v ~= thePlayer then
                  outputChatBox("*INFO: #ffff00" .. getPlayerName(thePlayer) .. "'s blip is now on top of your blip!",v,255,0,0,true)
          end
    end
end
addCommandHandler("incrementBlip", makeBlipHigher, false, false)