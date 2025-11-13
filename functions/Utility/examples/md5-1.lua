function md5it (player,command, theString) -- open function
  if theString then -- check if the string is exist
    md5string = md5(theString) -- get the md5 string
    outputChatBox(theString.. " -> " .. md5string , player, 255, 0, 0, false) -- output it
  end
end
addCommandHandler ("md5it", md5it) -- create command