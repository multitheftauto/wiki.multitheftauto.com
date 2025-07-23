local config = XML.load("config.xml")
-- If the file doesn't exist, we don't proceed.
if (not config) then
    return
end

-- Create a copy of xml structure in memory
local newFile = config:copy("copy/copy-config.xml")
if (newFile) then
  -- Write this new copy to a filesystem
  newFile:saveFile()
end
-- Unload config xml node from memory if it will not be used anytime soon
config:unload()