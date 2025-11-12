addCommandHandler ( "jetpack",
    function ( player )
        setPedWearingJetpack ( player, not isPedWearingJetpack ( player ) )
    end
)