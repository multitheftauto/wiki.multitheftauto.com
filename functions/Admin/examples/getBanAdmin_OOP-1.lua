local function outputBan(ban)
    local banned = ban.nick -- Get the name of the player who was banned
    local banner = ban.admin -- Get the name of the admin who banned the player
    local reason = ban.reason -- Get the reason the player was banned
    root:outputChat("-----BAN-----",255,0,0)
    if (banned) then
        root:outputChat("Player banned: "..banned,255,0,0) -- Output the player name who was banned
    end
    if (banner) then
        root:outputChat("Banner: "..banner,255,0,0) -- Output the admin name who performed the ban
    end
    if (reason) then
        root:outputChat("Reason: "..reason,255,0,0) -- outputt the reason the player was banned
    end
end
addEventHandler("onBan", root, outputBan) -- When a player is banned trigger the outputBan function