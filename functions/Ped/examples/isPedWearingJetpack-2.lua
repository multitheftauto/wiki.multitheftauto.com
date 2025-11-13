function onWarpMarkerHit ( player )
   -- check whether the player has a jetpack
   if ( not isPedWearingJetpack ( player ) ) then
      -- warp the player to their destination
      setElementPosition ( player, 1337, 1337, 50 )
   else
      -- tell the player to remove their jetpack
      outputChatBox ( "You must remove your jetpack to use this marker!", player )
   end
end

-- create a marker and add the function above to its onMarkerHit event
addEventHandler ( "onMarkerHit", createMarker( 3180, 200, 27 ), onWarpMarkerHit )