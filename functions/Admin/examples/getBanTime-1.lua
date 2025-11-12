function retrieveBan(theBan)
    local ban = getBanTime(theBan)
    if ban then
        outputChatBox("The time of the ban is: " .. ban, root, 255, 255, 255, false)
    end
end