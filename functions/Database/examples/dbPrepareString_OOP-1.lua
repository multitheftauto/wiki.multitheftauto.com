local serialsToUse = {"111", "222", "333"}

local queryString = connection:prepareString("SELECT * FROM `player_info` WHERE true")
for _, serial in ipairs(serialsToUse) do
    queryString = queryString ..connection:prepareString(" AND `serial`=?", serial)
end

local handle = connection:query(queryString)
