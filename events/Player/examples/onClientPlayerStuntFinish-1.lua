function onClientPlayerStuntStart(stuntType)
    outputChatBox("You started stunt: "..stuntType)
end
addEventHandler("onClientPlayerStuntStart", localPlayer, onClientPlayerStuntStart)

function onClientPlayerStuntFinish(stuntType, stuntTime, stuntDistance)
    outputChatBox("You finished stunt: "..stuntType..", time: "..stuntTime..", distance: "..stuntDistance)
end
addEventHandler("onClientPlayerStuntFinish", localPlayer, onClientPlayerStuntFinish)