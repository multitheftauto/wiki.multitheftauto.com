-- define the event handler function
function onWasted(killer, weapon, bodypart)
    if ( killer and getElementType(killer) == "player" and getElementType(source) == "player" ) then
        outputChatBox(getPlayerName(killer).." has killed ".. getPlayerName(source) ..".") -- output the kill message to the chatbox.
    end
end

-- add the event handler
addEventHandler("onClientPedWasted", getRootElement(), onWasted)