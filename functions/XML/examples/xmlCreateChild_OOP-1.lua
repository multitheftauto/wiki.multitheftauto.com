-- Creates a file named "new.xml" with root node "newroot" and childnode "newchild".
function createFileHandler()
    local RootNode = XML("new.xml"," newroot")
    if (not RootNode) then
        return
    end

    local NewNode = RootNode:createChild("newchild")
    if (not NewNode) then
        return
    end

    RootNode:saveFile()
    RootNode:unload()
end
addCommandHandler("createfile", createFileHandler)