addCommandHandler("lowlod",function ()
    local lowlods = 0
    for i, obj in ipairs(getElementsByType("object")) do
        if isElementLowLOD(obj) then
            lowlods = lowlods + 1    
        end
    end
    outputChatBox("Was found "..lowlods.." lowlod objects around you.",root,255,255,0)
end)