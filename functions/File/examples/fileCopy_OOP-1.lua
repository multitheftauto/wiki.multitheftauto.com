addEventHandler("onClientResourceStart", resourceRoot, function(res)
    local filePath = ":"..res.name.."/test.txt"
    File.new(filePath) --create the file in this resource and name it 'test.txt'.
    if File.copy(filePath,":"..res.name.."/test1.txt") then
        outputChatBox("File was successfully copied!", 0, 100, 0)
    else
        outputChatBox("File was not successfully copied, probably because it doesn't exist.", 100, 0, 0)
    end
end)