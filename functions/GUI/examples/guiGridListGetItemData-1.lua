function clientsideResourceStart ()
    local numberList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true )
    local column = guiGridListAddColumn ( numberList, "Column Title", 0.85 )
    if ( column ) then
        local row = guiGridListAddRow ( numberList )
        local myItem = guiGridListSetItemText ( numberList, row, column, tostring( math.random(0, 10) ^ 100 ), false, false )
        local myItemData = guiGridListGetItemData ( numberList, row, column )
        outputChatBox ( "My gridlist item data: " .. myItemData )
    end
end
addEventHandler ( "onClientResourceStart", resourceRoot, clientsideResourceStart )