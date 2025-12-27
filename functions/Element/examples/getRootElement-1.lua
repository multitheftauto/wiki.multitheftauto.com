local players = getElementsByType('player', getRootElement()) -- You can also use predefined global variable 'root' instead
outputChatBox("Players online: "..#players)

local vehicles = getElementsByType('vehicle', root) -- Use predefined global variable 'root'
outputChatBox("Vehicles on the map: "..#vehicles)