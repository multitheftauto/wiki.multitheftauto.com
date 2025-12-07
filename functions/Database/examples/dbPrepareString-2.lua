local playerInfos = {} -- some table

local queryString = dbPrepareString(connection, "INSERT INTO `player_info` (name,serial,ispoopoohead) VALUES ")
for idx, info in ipairs(playerInfos) do
    if idx > 1 then
        queryString = queryString .. ","
    end
    queryString = queryString .. dbPrepareString(connection, "(?,?,?)", info.name, info.serial, info.ispoopoohead)
end
queryString = queryString .. dbPrepareString(connection, " ON DUPLICATE KEY UPDATE name=VALUES(name),serial=VALUES(serial),ispoopoohead=VALUES(ispoopoohead) ")
dbExec(connection, queryString);