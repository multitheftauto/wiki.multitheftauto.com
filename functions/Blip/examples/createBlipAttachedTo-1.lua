-- Pick a random player
function setupRandomRobber()
    local myPlayer = getRandomPlayer()
    -- Create a radar blip at the player's position, with a 'cash' icon and only visible to everyone (no 'visibleTo' parameter)
    local myBlip = createBlipAttachedTo(myPlayer, 52)
end
