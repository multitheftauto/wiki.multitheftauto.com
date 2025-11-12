function checkboxBleepWhenClicked()
    if ( getElementType(source) == "gui-checkbox" ) then -- Is the element clicked a checkbox?
        if ( guiCheckBoxGetSelected(source) ) then
            playSoundFrontEnd(1) -- If the checkbox is selected play sound 1.
        else
            playSoundFrontEnd(2) -- If the checkbox isn't selected play sound 2.
        end
    end
end
addEventHandler("onClientGUIClick", root, checkboxBleepWhenClicked, false)