addCommandHandler ( "shutdown", function ( player, command, reason )
  if ( hasObjectPermissionTo ( player, "function.shutdown" ) ) then
    shutdown ( reason or "" )
  end
end )