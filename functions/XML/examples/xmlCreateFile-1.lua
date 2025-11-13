-- Creates a file named "new.xml" with root node "newroot" and childnode "newchild".
function createFileHandler()
   local rootNode = xmlCreateFile("new.xml","newroot")
   local childNode = xmlCreateChild(rootNode, "newchild")
   xmlSaveFile(rootNode)
   xmlUnloadFile(rootNode)
end

addCommandHandler("createfile", createFileHandler)