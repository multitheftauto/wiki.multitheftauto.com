function ResetModel ( )
    engineRestoreModel ( 587 )  -- Object / Vehicle to restore to default GTA one.
end

addEvent ( "restoreClientModel", true )
addEventHandler ( "restoreClientModel", root, ResetModel )