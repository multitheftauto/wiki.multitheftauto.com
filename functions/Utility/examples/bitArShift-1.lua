function getNumberAsBitString(value)
    if type(value) ~= 'number' then
        return false
    else
        local binary = ''

        for field = 31, 0, -1 do
            binary = binary .. bitExtract(value, field)

            if field % 4 == 0 then
                binary = binary ..' '
            end
        end

        return binary
    end
end

addCommandHandler('arshift',
    function (command, value, positions)
        if type(value) ~= 'string' or value:len() == 0 then
            return outputChatBox('* Syntax: /arshift [value] [positions = 1]')
        end

        if type(positions) ~= 'string' or positions:len() == 0 then
            positions = 1
        end

        local result = bitArShift(tonumber(value), tonumber(positions))
        local binary = getNumberAsBitString(result)

        outputChatBox('* Decimal: '.. result ..', Binary: '.. binary)
    end
)