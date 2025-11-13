local spam = {}

function setSkin(player, cmd, skin)
    if spam[player] and getTickCount() - spam[player] < 4000 then
        return outputChatBox("You cannot change skin that often!", player, 255, 0, 0)
    end

    skin = skin and tonumber(skin)

    if getElementModel(player) == skin or isPedDead(player) then
        return
    end

    if skin and skin <= 99999 then -- what do we know about dynamic ped ID range?
        setElementModel(player, skin)
        spam[player] = getTickCount()
    else
        outputChatBox("Invalid skin ID!", player, 255, 0, 0)
    end
end
addCommandHandler("skin", setSkin)

function cleanUp()
    if spam[source] then
        spam[source] = nil
    end
end
addEventHandler("onPlayerQuit", root, cleanUp)