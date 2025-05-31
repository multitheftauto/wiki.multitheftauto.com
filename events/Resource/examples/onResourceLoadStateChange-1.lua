function onResourceLoadStateChange (resource, oldState, newState)
    print ("Resource "..getResourceName (resource).." has changed it's state from "..tostring (oldState).." to "..tostring (newState))
end

addEventHandler ("onResourceLoadStateChange", root, onResourceLoadStateChange)