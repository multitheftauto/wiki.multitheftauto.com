function RestoreCollision ( )
    engineRestoreCOL ( 3356 )
end

addEvent ( "collisionRestore", true )
addEventHandler ( "collisionRestore", getRootElement(), RestoreCollision )