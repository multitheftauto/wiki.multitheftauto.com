function RestoreCols ( )
    triggerClientEvent ( "collisionRestore", getRootElement(), collisionRestore )
end
addCommandHandler("restorecol", RestoreCols)