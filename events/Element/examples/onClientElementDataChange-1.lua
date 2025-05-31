function scoreChangeTracker(theKey, oldValue, newValue)
    if (getElementType(source) == "player") and (theKey == "score") then
        outputChatBox(getPlayerName(source).."'s new score is "..newValue.."!")
    end
end
addEventHandler("onClientElementDataChange", root, scoreChangeTracker)