local object = createObject(1337,0,0,3)
local oldMass = getObjectMass(object)
local newMass = oldMass+300.0
setObjectMass(object,newMass)
outputChatBox("Object Old Mass: "..oldMass..", New Mass: "..newMass)