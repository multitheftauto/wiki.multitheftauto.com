function outputAuthor(newAuthorName)
    author = getResourceInfo ( getThisResource(), "author" )    --Get the authors name
    if author then    --if it exists
        outputChatBox( author .. " made this script." )    --tell the world his name
    else    --if it doesn't
        setResourceInfo ( getThisResource(), "author", newAuthorName )
        outputChatBox( "Author set to: "..newAuthorName )    --tell them that it was set
    end
end