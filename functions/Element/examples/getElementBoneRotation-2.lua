local settings = {
    copyDiscord = false; -- true = "yes" // false = "no" - Copy to paste table in discord format.
    tableName = "bonesPos"; -- Table name to be copied.
}

local boneIDs = {0, 1, 2, 3, 4, 5, 6, 7, 8, 21, 22, 23, 24, 25, 26, 31, 32, 33, 34, 35, 36, 41, 42, 43, 44, 51, 52, 53, 54, 201, 301, 302}

addCommandHandler ("getbonerotation", function ()
    local bonesPositions = { }
    local bonesConverted = ""
    for _, v in ipairs (boneIDs) do
        local x, y, z = getElementBoneRotation (localPlayer, v)
        table.insert (bonesPositions, "["..v.."] = {"..x..", "..y..", "..z.."};")
    end
    for i, v in ipairs (bonesPositions) do
        bonesConverted = "    "..bonesConverted.."\n".."    "..v
    end
    setClipboard ((settings["copyDiscord"] and "```lua\nlocal "..string.gsub(settings["tableName"], " ", "_").." = {"..bonesConverted.."\n}\n```" or "local "..string.gsub(settings["tableName"], " ", "_").." = {"..bonesConverted.."\n}"))
    outputChatBox ("Copy to clipboard.")
end)