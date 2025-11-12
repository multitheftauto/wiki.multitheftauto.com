-- from https://gist.github.com/kgriffs/124aae3ac80eefe57199451b823c24ec
local function stringEndsWith(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

-- get all files from a models directory that exists in the resource root folder (resources/ResourceName)
-- and load them into the game
addEventHandler('onClientResourceStart', resourceRoot, function()
    local entries = pathListDir('models') or {}
    for _, fileOrFolder in ipairs(entries) do
        if pathIsFile(fileOrFolder) then
            local file = fileOrFolder
            local modelName = tonumber(file:sub(1, -5))
            if modelName then
                -- the full path to the file
                local filePath = 'models/'..file

                if stringEndsWith(file, '.col') then
                    local colData = engineLoadCOL(filePath)
                    if colData then
                        engineReplaceCOL(colData, modelName)
                    end
                end
                if stringEndsWith(file, '.txd') then
                    local txdData = engineLoadTXD(filePath)
                    if txdData then
                        engineImportTXD(txdData, modelName)
                    end
                end
                if stringEndsWith(file, '.dff') then
                    local dffData = engineLoadDFF(filePath)
                    if dffData then
                        engineReplaceModel(dffData, modelName)
                    end
                end
            end
        end
    end
end, false)