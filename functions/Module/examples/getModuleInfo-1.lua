function printModuleInfo ( thePlayer )
    local modules = getLoadedModules()
    if #modules == 0 then
        return outputConsole ( "There are no modules loaded!", thePlayer ) -- Return as no module is loaded, the for has nothing todo
    end

    for k, v in ipairs ( modules ) do
        local moduleInfo = getModuleInfo ( v )
        outputConsole ( moduleInfo.name .. "(" .. v .. ") v" .. moduleInfo.version .. ", author: " .. moduleInfo.author, thePlayer )
    end
end
addCommandHandler ( "checkmodules", printModuleInfo )