function preventLevelChange(account, key, value)
    if (key == "level") then
        cancelEvent()
    end
end
addEventHandler("onAccountDataChange", root, preventLevelChange)