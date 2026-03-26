function checkboxBleepWhenClicked()
    if (source.type == "gui-checkbox") then -- Is the element clicked a checkbox?
        if (source.selected) then
            Sound.playFrontEnd(1) -- If the checkbox is selected play sound 1.
        else
            Sound.playFrontEnd(2) -- If the checkbox isn't selected play sound 2.
        end
    end
end
addEventHandler("onClientGUIClick", root, checkboxBleepWhenClicked, false)
