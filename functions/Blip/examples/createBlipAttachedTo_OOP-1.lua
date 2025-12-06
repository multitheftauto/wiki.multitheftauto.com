-- Pick a random player
function setupRandomRobber()
    local myPlayer = Player.getRandom()
    -- Create a radar blip at the player's position, with a 'cash' icon and only visible to everyone (no 'visibleTo' parameter)
    local myBlip = Blip.createAttachedTo(myPlayer, 52)
end
