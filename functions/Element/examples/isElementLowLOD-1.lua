addCommandHandler("lowlod",function ()
    local lowlods = 0
    for i, obj in ipairs(getElementsByType("object",root,true)) do
        if isElementLowLOD(obj) then
            lowlods = lowlods + 1    
        end
    end
    outputChatBox("Was found "..lowlods.." lowlod objects around you.",255,255,0)
end)