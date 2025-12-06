if fileRename("test1.txt", "myFolder/test1.txt") then
    outputConsole("File `test1.txt` successfuly moved to `myFolder` folder")
else
    outputConsole("Unable to move `test1.txt`")
end
