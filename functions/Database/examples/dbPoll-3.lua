local result = dbPoll(qh, -1)

if result then
    for _, row in ipairs(result) do

        -- by using a second loop (use it if you want to get the values of all columns the query selected):
        for column, value in pairs(row) do
            -- column = the mysql column of the table in the query
            -- value = the value of that column in this certain row
        end

        -- or without a second loop (use it if you want to handle every value in a special way):
        outputChatBox(row["column"]) -- it will output the value of the column "column" in this certain row
    end
end
