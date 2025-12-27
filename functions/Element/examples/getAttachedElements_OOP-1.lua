addCommandHandler('count', function()
    local attachedElements = localPlayer:getAttachedElements();
    outputConsole("There are "..#attachedElements.." element(s) attached to you.")
end)