addEventHandler("onClientPlayerWasted", root, function(killer, weapon)
    if (killer == localPlayer) then
        local scoreToAdd = weapon == 0 and 10 or 5 -- Fist kills give more points
        local currentScore = getElementData(localPlayer, "playerScore") or 0
        setElementData(localPlayer, "playerScore", currentScore + scoreToAdd, false) -- Data not synchronized to server
    end
end)

addCommandHandler("showscore", root, function()
    local score = getElementData(localPlayer, "playerScore") or 0
    outputChatBox("Your current score is: " .. score)
end)

addEventHandler('onClientResourceStart', resourceRoot, function()
    setElementData(localPlayer, "playerScore", 0, false) -- Data not synchronized to server
end)