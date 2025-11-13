local img = engineLoadIMG( "file.img" )
local filesInArchive = engineImageGetFiles( img )

outputChatBox("'file.img' contains files:")
for fileId = 1, #filesInArchive do
    outputChatBox(fileId .. ": " .. filesInArchive[fileId])
end