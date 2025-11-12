function loadMap()
   -- create a *building* at a specified position with a specified rotation
   createBuilding(4550, 1985, -2544, 94, 0,0,0) -- Maze Bank Tower in LS airport
end
addEventHandler("onClientResourceStart", resourceRoot, loadMap, false)