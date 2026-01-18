-- *****************************************************************************
-- SERVER CODE
function commandFunction(source)
    triggerClientEvent(source, "toClientSide", resourceRoot, "Hello World!")
end
addCommandHandler("cool", commandFunction)

-- *****************************************************************************
-- CLIENT CODE
function nameFunction(message)
    if source == resourceRoot then
        outputChatBox(message)
    end
end
addEvent("toClientSide", true )
addEventHandler("toClientSide", resourceRoot, nameFunction)