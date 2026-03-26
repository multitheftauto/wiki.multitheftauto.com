local list = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
list:addColumn("Column 1")

for i = 1,15 do
    list:addRow()
end

local rows = list.rowCount
print("Rows: "..rows) -- Rows: 15