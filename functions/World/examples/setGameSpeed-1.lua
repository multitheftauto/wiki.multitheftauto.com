addCommandHandler("setgamespeed",
  function(sourcePlayer, command, value)
    setGameSpeed(tonumber(value))
  end
)