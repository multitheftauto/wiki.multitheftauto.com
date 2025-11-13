function keysCommand ( command, controlName )
    if not controlName then                     -- make sure they specified a control name
        outputChatBox ( "No control name specified", 255, 0, 0 )
        return
    end
    local keys = getBoundKeys ( controlName )   -- get the keys bound to this control
    if not keys then                            -- make sure the control name is valid and any keys are bound to it
        outputChatBox ( "No keys bound to " .. controlName, 255, 0, 0 )
        return
    end
    outputChatBox ( "Keys bound to " .. controlName .. ":", 0, 255, 0 )
    for keyName, state in pairs(keys) do
        outputChatBox ( keyName, 0, 255, 0 )
    end
end

addCommandHandler ( "keys", keysCommand )