function callAdmin ( playerSource )
    -- get the account of the user trying to use this function first
    local sourceAccount = playerSource.account
    -- if they're a guest
    if sourceAccount.guest then
        -- tell them to register
        outputConsole ( "Please register to use this function!", playerSource )
    else
        -- your code to call the admin would go here
    end
end
-- attach the function 'callAdmin' as a handler to the command "call_admin"
addCommandHandler ( "call_admin", callAdmin )