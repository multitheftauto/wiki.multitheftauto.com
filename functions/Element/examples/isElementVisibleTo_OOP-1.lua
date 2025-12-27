addCommandHandler('countvisibleblips', function(plr)
    local visibleBlips = 0

    for k, v in ipairs(Element.getAllByType("blip")) do
        if v:isVisibleTo(plr) then
            visibleBlips = visibleBlips + 1
        end
    end

    plr:outputChat("You can see " .. visibleBlips .. " blips.")
end)
