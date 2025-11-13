function RestoreModel ( )
    triggerClientEvent ( "restoreClientModel", root, restoreClientModel )
end
addCommandHandler( "restore", RestoreModel )