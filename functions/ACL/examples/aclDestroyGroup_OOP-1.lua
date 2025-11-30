local function removeACLGroup(source, command, groupName)
    -- Check if they're an admin...
    local adminGroup = ACLGroup.get("Admin")
    if (adminGroup and adminGroup:doesContainObject('user.' .. source.account.name)) then
        if (groupName) then -- Check if they specified the group name
            local group = ACLGroup.get(groupName) -- Return any groups matching the name
            if (group) then -- If any were returned then...
                group:destroy() -- Destroy that group
            else
                -- Tell them if no groups with that name were found...
                source:outputChat("No group with that name was found.", 255, 0, 0)
            end
        else -- If they didn't specify the group
            source:outputChat("Please specify the group name.", 255, 0, 0) -- Tell them that they must
        end
    else -- If they're not an admin....
        source:outputChat("You must be an admin to use this command", 255, 0, 0) -- Tell them it's restricted
    end
end
addCommandHandler("removeACL", removeACLGroup) -- Make it happen when somebody types "/removeACL"
