function preventLevelChange(account, key, value)
    if (wasEventCancelled()) then return end -- If the data change was aborted don't log it.
    outputServerLog(getAccountName(account) .. " key: " .. key .. " changed to: " .. tostring(value))
end
addEventHandler("onAccountDataChange", root, preventLevelChange)