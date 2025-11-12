function setTrayOnMinimize()
     createTrayNotification("We are waiting for you again...", "warning")
end
addEventHandler("onClientMinimize", root, setTrayOnMinimize)