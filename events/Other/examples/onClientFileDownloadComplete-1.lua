addEventHandler("onClientFileDownloadComplete", root, function(file, success)
    -- if the file relates to other resource
    if source ~= resourceRoot then
        return
    end

    -- if the file download failed
    if not success then
        outputChatBox(file..' failed to download')
        return
    end

    -- check if filename ends with .mp3
    if file:sub(-4) ~= '.mp3' then
        return
    end

    -- if so, play the sound
    playSound(file)
end)