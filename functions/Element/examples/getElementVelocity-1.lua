-- get a random player and get its velocity
speedx, speedy, speedz = getElementVelocity ( getRandomPlayer() )

-- use pythagorean theorem to get actual velocity
-- raising something to the exponent of 0.5 is the same thing as taking a square root.
actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) -- can be: math.sqrt(speedx^2 + speedy^2 + speedz^2)

-- multiply by 50 to obtain the speed in metres per second
mps = actualspeed * 50

-- other useful conversions
-- kilometres per hour
kmh = actualspeed * 180
-- miles per hour
mph = actualspeed * 111.847

-- report the results.
outputChatBox ( "Someguy's current velocity: " .. mps .. " metres per second." )