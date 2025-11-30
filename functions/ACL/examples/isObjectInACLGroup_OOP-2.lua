addCommandHandler("admins", function(plr, cmd)
    local admins = ""
    for k, v in ipairs(Element.getAllByType("player")) do
        local account = v.account
        if (account and not account.guest) then
            local adminGroup = ACLGroup.get("Admin")
            if (adminGroup and adminGroup:doesContainObject("user." .. account.name)) then
                if (admins == "") then
                    admins = v.name
                else
                    admins = admins .. ", " .. v.name
                end
            end
        end
    end

    plr:outputChat("Online admins: ", 255, 255, 0)
    plr:outputChat(admins, 255, 255, 0)
end)
