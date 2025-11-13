function getMyBlip(theBlip)
    local ordering = getBlipOrdering ( theBlip )
    if (ordering) then
        outputChatBox("The following blip has a ordering of "..ordering)
    end
end