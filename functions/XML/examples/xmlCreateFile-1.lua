-- Creates a file named "new.xml" with root node "newroot" and childnode "newchild".
function createFileHandler()
    local RootNode = xmlCreateFile("new.xml"," newroot")
    if (not RootNode) then
        return
    end

    local NewNode = xmlCreateChild(RootNode, "newchild")
    if (not NewNode) then
        return
    end

    xmlSaveFile(RootNode)
    xmlUnloadFile(RootNode)
end
addCommandHandler("createfile", createFileHandler)