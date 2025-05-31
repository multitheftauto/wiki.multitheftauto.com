addEventHandler('onAccountRemove', root, function(acc)
    local accName = getAccountName(acc)
    local accType = getAccountType(acc) or 'Unknown'
    iprint('An account has been removed! Type: '..accType..', name: '..accName)
end)