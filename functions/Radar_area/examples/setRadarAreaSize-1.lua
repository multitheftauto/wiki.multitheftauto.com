-- assume that team elements exist and that each player belongs to one of them
-- assume that radararea elements exist and that each is a child of one of the teams
function playerWasted ( killer, killerweapon, bodypart )
    local victimteam = getPlayerTeam ( source )                 -- get the team of the victim
    local killerteam = getPlayerTeam ( killer )                 -- get the team of the killer
    if ( killer and killerteam ~= victimteam ) then             -- if there is a killer and he is from an opposing team
        local victimarea = getElementChild ( victimteam, 0 )    -- get the radararea belonging to the victim's team
        local x, y = getRadarAreaSize ( victimarea )            -- get the size of the radar area
        x = x - 5
        y = y - 5
        setRadarAreaSize ( victimarea, x, y )                   -- set a new (smaller) size for the victim's radar area
    end
end
addEventHandler ( "onPlayerWasted", root, playerWasted )