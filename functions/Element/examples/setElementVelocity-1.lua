function equalTwoRandomPlayersVelocity()
    if getPlayerCount() < 2 then -- If there's only one player (or no players) this doesn't make sense
        return false
    end

    local randomPlayer1, randomPlayer2 = getRandomPlayer(), getRandomPlayer() -- Get two random players
    while randomPlayer1 == randomPlayer2 do -- Make sure the two players are different
        randomPlayer2 = getRandomPlayer()
    end

    local speedx, speedy, speedz = getElementVelocity (randomPlayer1) -- Get the velocity of the first random player
    setElementVelocity(randomPlayer2, speedx, speedy, speedz) -- Copy that velocity to the second random player
    outputChatBox("Now " .. getPlayerName(randomPlayer2) .. " runs as fast as " .. getPlayerName(randomPlayer1) .. "!", root, 255, 128, 0)
    return true
end