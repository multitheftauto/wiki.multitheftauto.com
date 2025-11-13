local thisResource = getThisResource()
local resRoot = getResourceRootElement(thisResource)

addEventHandler("onResourceStart", resRoot, function()
   local resourceName = getResourceName(thisResource)
   iprint("You are in the " .. resourceName .. " resource!")
   iprint(thisResource == resource) -- true
   iprint(resRoot == resourceRoot) -- true
end)