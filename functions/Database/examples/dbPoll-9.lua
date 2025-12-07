local multiResults = dbPoll(qh, -1, true)

if multiResults then
    for sidx, statementResult in ipairs(multiResults) do
        local resultRows, numAffectedRows, lastInsertId = unpack(statementResult)
        for ridx, row in ipairs(resultRows) do
            for column, value in pairs(row) do
                outputDebugString("" .. " statement#" .. sidx .. " row#" .. ridx .. " column:" ..tostring(column) .. " value:" .. tostring(value))
            end
        end
    end
end
