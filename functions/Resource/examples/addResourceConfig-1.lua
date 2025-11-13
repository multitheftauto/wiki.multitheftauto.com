function onStart()
   addResourceConfig(":ctf/settings.xml", "server")
end
addEventHandler("onResourceStart",getResourceRootElement(),onStart)