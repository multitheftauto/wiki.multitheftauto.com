local r, g, b = getWorldProperty("AmbientColor")
outputChatBox("Ambient Color: "..table.concat({r, g, b}, ", "))