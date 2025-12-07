local serialsToUse = {"111", "222", "333"}

local queryString = dbPrepareString(connection, "SELECT * FROM `player_info` WHERE true")
for _, serial in ipairs(serialsToUse) do
    queryString = queryString ..dbPrepareString(connection, " AND `serial`=?", serial)
end

local handle = dbQuery(connection, queryString)
