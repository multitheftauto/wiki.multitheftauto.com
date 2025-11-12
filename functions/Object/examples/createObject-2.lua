function loadMapObjects()
   -- create an object at a specified position with a specified rotation
   createObject(1337, 5540.6654, 1020.55122, 1240.545, 90, 0, 0)
end
addEventHandler("onResourceStart", resourceRoot, loadMapObjects)