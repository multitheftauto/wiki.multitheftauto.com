local function retrieveBan(theBan)
    local ban = theBan.time
    if (ban) then
        root:outputChat("The time of the ban is: " .. ban, 255, 255, 255, false)
    end
end