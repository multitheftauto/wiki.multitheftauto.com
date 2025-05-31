addEventHandler('onAccountCreate', root, function(acc)
    local accName = getAccountName(acc)
    local accType = getAccountType(acc) or ''
    iprint('Registered a new '..accType..' account: '..accName)
end)