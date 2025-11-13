function animRender( ped1 )
    setPedAnimationProgress( ped1, "M_SMKSTND_LOOP", 0.5 )
    setTimer( animRender, 50, 1, ped1 )
end

function makePed( )
    local ped1 = createPed( 56, 1, 1, 4 )
    setPedAnimation( ped1, "SMOKING", "M_SMKSTND_LOOP" )
    setTimer ( animRender, 50, 1, ped1 )
end
addCommandHandler( "makemyped", makePed )