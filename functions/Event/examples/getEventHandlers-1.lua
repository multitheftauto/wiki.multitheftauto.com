function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
    if type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function' then
        local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
        if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs(aAttachedFunctions) do
                if v == func then return true end
            end
        end
    end
    return false
end

function onPlayerWasted()
	outputChatBox(getPlayerName(source) .. ' died.')
end
addEventHandler('onPlayerWasted', root, onPlayerWasted)

addCommandHandler('removeOnPlayerWastedEvent', function()
    if isEventHandlerAdded('onPlayerWasted', root, onPlayerWasted) then
        outputChatBox('onPlayerWasted succesfully removed!')
        removeEventHandler('onPlayerWasted', root, onPlayerWasted)
    end
end)
