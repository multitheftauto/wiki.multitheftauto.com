function deleteTabOnClick()
    if (getKeyState("lctrl") and source.type == "gui-tab") then -- if the user is holding down left control
        source:delete(source.parent) -- delete the tab. No need to check if it was actually a tab that was clicked, as this function doesn't work on other controls anyway
    end
end
addEventHandler("onClientGUIClick", resourceRoot, deleteTabOnClick) -- add an event handler for clicks
