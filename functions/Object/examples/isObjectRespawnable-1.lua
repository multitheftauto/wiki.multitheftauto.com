addCommandHandler('checkobjects', function()
    local count = 0
    for k,v in ipairs(getElementsByType('object')) do
        if (isObjectRespawnable(v)) then
            count = count + 1
        end
    end

    outputChatBox(count..' objects on map are respawnable!')
end)