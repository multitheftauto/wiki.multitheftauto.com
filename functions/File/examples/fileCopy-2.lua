addEventHandler("onResourceStart", resourceRoot, function(res)
    local filePath = ":"..getResourceName(res).."/test.txt"
    fileCreate(filePath) --create the file in this resource and name it 'test.txt'.
    if fileCopy(filePath, ":"..getResourceName(res).."/test1.txt") then
        outputChatBox("File was successfully copied!", root, 0, 100, 0)
    else
        outputChatBox("File was not successfully copied, probably because it doesn't exist.", root, 100, 0, 0)
    end
end)