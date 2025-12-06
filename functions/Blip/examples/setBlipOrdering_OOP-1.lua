function makeBlipHigher(thePlayer)
    local setmeup = Blip.createAttachedTo(thePlayer, 3, 3, 255, 0,0,255,0,99999.0, root)
    setmeup.ordering = setmeup.ordering + 1
    thePlayer:outputChat("*INFO: #ffff00Your blip is now on top of others!", 255,0,0,true)
    for i, v in ipairs(Element.getAllByType("player")) do
        if (v ~= thePlayer) then
            v:outputChat("*INFO: #ffff00" .. thePlayer.name .. "'s blip is now on top of your blip!", 255, 0, 0, true)
        end
    end
end
addCommandHandler("incrementBlip", makeBlipHigher, false, false)