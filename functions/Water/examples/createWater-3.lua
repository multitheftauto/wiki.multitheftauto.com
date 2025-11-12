function fillDock()
    waters = {
        createWater (-1612, 108, 0, -1550, 108, 0, -1612, 170, 0),
        createWater (-1733, 48, 0, -1612, 48, 0, -1612, 170, 0),
        createWater (-1673, 48, 0, -1612, 48, 0, -1673, -13, 0),
        createWater (-1612, 86, 0, -1574, 86, 0, -1612, 48, 0),
        createWater (-1612, 86, 0, -1574, 86, 0, -1612, 108, 0, -1574, 108, 0), -- Rectangle
        createWater (-1610, 168, 0, -1600, 168, 0, -1610, 170, 0, -1600, 170, 0), -- Rectangle
        createWater (-1612, 170, 0, -1610, 170, 0, -1610, 168, 0),
    }
end
addEventHandler ("onResourceStart", resourceRoot, fillDock)