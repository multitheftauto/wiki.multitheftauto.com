function getMyBlip(theBlip)
    local ordering = theBlip.ordering
    if (ordering) then
        outputChatBox("The following blip has a ordering of "..ordering)
    end
end