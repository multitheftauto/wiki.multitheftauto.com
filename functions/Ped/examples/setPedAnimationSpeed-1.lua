addCommandHandler('dance',
  function( player, cmd )
      setPedAnimation( player, 'DANCING', 'DAN_Down_A', -1 )
      setTimer(function(plr)
          if isElement(plr) then setPedAnimationSpeed( plr, 'DAN_Down_A', 0.2 ) end
      end,5000,1,player)
   end
)