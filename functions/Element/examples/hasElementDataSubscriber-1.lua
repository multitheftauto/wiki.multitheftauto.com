local nameOfOurElementData = "random" --// name our element data

for i,v in ipairs(getElementsByType("player")) do --// loop through all the players on the server
    setElementData(v, nameOfOurElementData, true, "subscribe") --// set our element data to all players on server
end

function checkIsSubscribed(plr,cmd, key)

    if not key then return end --// check if you've typed element data key

    local randomPlayer = getRandomPlayer() --// getting random player from server

    local isSubscribed = hasElementDataSubscriber(randomPlayer, tostring(key), randomPlayer) --// use our function

    if not isSubscribed then --// if random player is not subscribed to given element data key then add him to subscription

        addElementDataSubscriber(randomPlayer, tostring(key), randomPlayer)
        outputChatBox("Element data key: "..tostring(key).." is now subscribed to: "..getPlayerName(randomPlayer), plr, 255, 255, 255, true)

    else --// if he is subscribed to given element data then remove him from subscription

        removeElementDataSubscriber(randomPlayer, tostring(key), randomPlayer)
        outputChatBox(getPlayerName(randomPlayer).." has been removed from subscription from element data key: "..tostring(key), plr, 255, 255, 255, true)

    end


end
addCommandHandler("checksub", checkIsSubscribed, false, false) --// creating command /checksub not restricted and not CASE sensitive

--// EXAMPLE: /checksub random