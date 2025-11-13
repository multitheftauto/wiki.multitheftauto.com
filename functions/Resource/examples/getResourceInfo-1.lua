function outputAuthor()
    author = getResourceInfo ( getThisResource(), "author" )    --Get the authors name
    if author then    --if it exists
        outputChatBox( author .. " made this script." )    --tell the world his name
    else    --if it doesn't
        outputChatBox( "I've no idea who made this script." )    --apologize.
    end
end