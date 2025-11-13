function commandFunction(source)
    triggerClientEvent(source, "toClientSide", resourceRoot, "Hello World!")
end
addCommandHandler("cool", commandFunction)