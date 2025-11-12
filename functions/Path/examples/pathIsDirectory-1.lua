function string.startsWith(str, start)
    return string.sub(str, 1, #start) == start
end

function string.repetition(what, n)
    local out = ''
    for i=1, n do
        out = out..what
    end
    return out
end

local function getStructure(thePath)
    if thePath:startsWith('/') then
        thePath = thePath:sub(2)
    end

    local structure = {}
    for _, entry in ipairs(pathListDir(thePath)) do
        local entryPath = thePath..'/'..entry
        if pathIsDirectory(entryPath) then
            structure[entry] = getStructure(entryPath)
        elseif pathIsFile(entryPath) then
            structure[entry] = false
        end
    end
    return structure
end

local function printStructure(struct, tab)
    tab = tab or 0
    for entry, isDir in pairs(struct) do
        iprint(string.repetition(' ',tab)..'- '..entry)
        if isDir then
            printStructure(isDir, tab + 2)
        end
    end
end

printStructure(getStructure('.'))