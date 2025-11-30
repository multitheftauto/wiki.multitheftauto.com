function ChangePlayerPassword(player, command, oldpass, newpass)
    -- get the account the player is currently logged into
    local account = getPlayerAccount(player)
    if (account) then
        -- if its only a guest account, do not allow the password to be changed
        if (isGuestAccount(account)) then
            outputChatBox("You must be logged into an account to change your password.", player)
            -- end the function
            return
        end

        -- check that the old password is correct
        local password_check = getAccount(getAccountName(account), oldpass)
        if (password_check) then
            -- check the length of the new password
            if (string.len(newpass) >= 5) then
                setAccountPassword(account, newpass)
            else
                outputChatBox("Your new password must be at least 5 characters long.", player)
            end
        else
            outputChatBox("Old password invalid.", player)
        end
    end
end
addCommandHandler("changepass", ChangePlayerPassword)
