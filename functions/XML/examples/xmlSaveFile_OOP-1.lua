-- Creates a file named "new.xml" with root node "newroot" and childnode "newchild".
function createFileHandler()
    local RootNode = XML("new.xml"," newroot")
    local NewNode = RootNode:createChild("newchild")
    RootNode:saveFile()
    RootNode:unload()
end
addCommandHandler("createfile", createFileHandler)