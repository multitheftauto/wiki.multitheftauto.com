addCommandHandler('doShake', function()
    shakeCamera(100)
    setTimer(resetShakeCamera, 5000, 1)
end)