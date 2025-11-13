function safeArgsForTransfer(...)
    local args = { ... }
    for index, arg in ipairs(args) do
        if type(arg) == "userdata" and getUserdataType(arg):match("vector") then
            -- Transform every kind of vector userdata to a table which can be transfered safely
            args[index] =
            {
                arg:getX(),
                arg:getY(),
                arg.getZ and arg:getZ() or nil,
                arg.getW and arg:getW() or nil,
                -- Extra field to distinguish from normal tables
                ["isVectorWorkaround"] = true
            }
        end
    end
    return unpack(args)
end