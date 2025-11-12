for _,ban in ipairs(getBans())do
    if getBanIP(ban) == "1.2.3.4" then
        removeBan(ban)
    end
end