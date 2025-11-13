local xml = getResourceConfig("settings.xml")      -- load XML file and get its root element
local carmodel = xmlNodeGetAttribute(xml, "model")    -- get attribute of root element
local carX = xmlNodeGetAttribute(xml, "posX")
local carY = xmlNodeGetAttribute(xml, "posY")
local carZ = xmlNodeGetAttribute(xml, "posZ")
local carA = xmlNodeGetAttribute(xml, "rot")
createVehicle(carmodel, tonumber(carX), tonumber(carY), tonumber(carZ), 0.0, 0.0, tonumber(carA))