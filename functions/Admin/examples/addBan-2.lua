function banSerial( source, command, noob, reason )
   if ( noob ) then
      local theNoob = getPlayerFromName( noob )
      if ( theNoob ) then
         local theNoobSerial = getPlayerSerial( theNoob )
         addBan( nil, nil, theNoobSerial, source, reason )
      end
   end
end
addCommandHandler( "ban-serial", banSerial )