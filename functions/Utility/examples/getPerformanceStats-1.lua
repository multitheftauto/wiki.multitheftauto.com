local columns, rows = getPerformanceStats("")
outputChatBox(table.concat(columns, "  "))
outputChatBox("----------------")
for i, row in ipairs(rows) do
  outputChatBox(table.concat(row, "  "))
end