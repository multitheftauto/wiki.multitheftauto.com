Combo = guiCreateComboBox ( 0.20, 0.03, 0.25, 0.30, "Example", true )
Memo = guiCreateMemo( 10, 50, 500, 150, "", false)
addEventHandler ( "onClientGUIComboBoxAccepted", guiRoot,
    function ( comboBox )
        if ( comboBox == Combo ) then
            local item = guiComboBoxGetSelected ( Combo )
            local text = tostring ( guiComboBoxGetItemText ( Combo , item ) )
            if ( text ~= "" ) then
                 guiSetText ( Memo , text )
            end
        end
    end
)