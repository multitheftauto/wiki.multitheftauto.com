local function setReason(player, cmd, name, ...)
    local reason = table.concat({...}, " ")
    if (name and reason) then
        local bans = Ban.getList()
        for i, v in ipairs(bans) do
            if (v.nick == name) then
                v.reason = reason
                player:outputChat("Successfully edited the new Ban Reason.", 0, 125, 0)
            end
        end
    end
end
addCommandHandler("setreason", setReason)
