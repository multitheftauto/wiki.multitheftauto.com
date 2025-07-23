local xml = getResourceConfig("settings.xml")      -- load XML file and get its root element
local carmodel = xml:getAttribute("model")    -- get attribute of root element
local carX = xml:getAttribute("posX")
local carY = xml:getAttribute("posY")
local carZ = xml:getAttribute("posZ")
local carA = xml:getAttribute("rot")
Vehicle(carmodel, tonumber(carX), tonumber(carY), tonumber(carZ), 0.0, 0.0, tonumber(carA))