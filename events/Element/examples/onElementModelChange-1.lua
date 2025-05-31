function informPlayerOnModelChange(oldModel, newModel)
    if ( getElementType(source) == "player" ) then -- Make sure the element is a player
        outputChatBox("Model ID changing from: "..oldModel.." to: ".. newModel, source, 0, 255, 0) -- Message for player
    end
end
addEventHandler("onElementModelChange", root, informPlayerOnModelChange) -- Bind the event to every element