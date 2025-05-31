addEventHandler( "onPlayerNetworkStatus", root,
  function( status, ticks )
    if status == 0 then
      outputDebugString( "(packets from " .. getPlayerName(source) .. ") interruption began " .. ticks .. " ticks ago" )
    elseif status == 1 then
      outputDebugString( "(packets from " .. getPlayerName(source) .. ") interruption began " .. ticks .. " ticks ago and has just ended" )
    end
  end
)