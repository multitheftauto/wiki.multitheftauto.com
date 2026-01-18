local img = EngineIMG("file.img")
local filesInArchive = img.files

outputChatBox("'file.img' contains files:")
for fileId = 1, #filesInArchive do
    outputChatBox(fileId .. ": " .. filesInArchive[fileId])
end
