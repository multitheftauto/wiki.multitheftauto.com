function nameFunction(message)
    if source == resourceRoot then
        outputChatBox(message)
    end
end
addEvent("toClientSide", true )
addEventHandler("toClientSide", resourceRoot, nameFunction)