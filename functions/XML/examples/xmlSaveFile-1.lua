-- Creates a file named "new.xml" with root node "newroot" and childnode "newchild".
function createFileHandler()
    local RootNode = xmlCreateFile("new.xml"," newroot")
    local NewNode = xmlCreateChild(RootNode, "newchild")
    xmlSaveFile(RootNode)
    xmlUnloadFile(RootNode)
end
addCommandHandler("createfile", createFileHandler)