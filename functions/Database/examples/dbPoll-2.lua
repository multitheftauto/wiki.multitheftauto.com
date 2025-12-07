local result, num_affected_rows, last_insert_id = dbPoll(qh, -1)

if result == nil then
    outputConsole("dbPoll result not ready yet")
elseif result == false then
    local error_code, error_msg = num_affected_rows, last_insert_id
    outputConsole("dbPoll failed. Error code: " .. tostring(error_code) .."  Error message: " .. tostring(error_msg))
else
    outputConsole("dbPoll succeeded. Number of affected rows: " ..tostring(num_affected_rows) .. "  Last insert id: " ..tostring(last_insert_id))
end
