function clientsideResourceStart ()
    local numberList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true ) --Create a gridlist
    local column = guiGridListAddColumn( numberList, "Column Title", 0.85 ) --Create a column on the gridlist
    if ( column ) then --If the column was created successfully
        local count = 0 -- Set the varible 'count' to the value 0
        while count <= 10 do --Loop through 10 times adding random numbers in rows for the column
            local row = guiGridListAddRow ( numberList )
            guiGridListSetItemText ( numberList, row, column, tostring(math.random(0, 10) ^ 100), false, false )
            count = count + 1
        end
        guiGridListAutoSizeColumn ( numberList, column ) --After the numbers are added in rows, perform auto sizing on the column
    end
end
addEventHandler ( "onClientResourceStart", resourceRoot, clientsideResourceStart )