local res = getResourceFromName ( "scoreboard" )
if res then
    local functionNames = getResourceExportedFunctions ( res )
    outputConsole ( "The scoreboard resource exports " .. #functionNames .. " functions:" )
    for i, name in ipairs ( functionNames ) do
        outputConsole ( name )
    end
else
    outputConsole ( "Unable to find the scoreboard resource." )
end