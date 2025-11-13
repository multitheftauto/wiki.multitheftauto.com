local config = xmlLoadFile("config.xml")
-- create a copy of xml structure in memory
local newFile = xmlCopyFile(config, "copy/copy-config.xml")
if newFile then
  -- write this new copy to a filesystem
  xmlSaveFile(newFile)
end
-- unload config xml node from memory if it will not be used anytime soon
xmlUnloadFile(config)