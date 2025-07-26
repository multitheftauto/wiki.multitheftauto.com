local function banSerial(source, command, noob, reason)
    if (noob) then
        local theNoob = Player(noob)
        if (theNoob) then
            local theNoobSerial = theNoob.serial
            Ban(nil, nil, theNoobSerial, source, reason)
        else
            source:outputChat("Player "..noob.." not found.")
        end
    end
end
addCommandHandler("ban-serial", banSerial)