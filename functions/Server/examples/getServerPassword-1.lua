function viewPassword ( thePlayer, command )
  -- Put the password in a var
  local password = getServerPassword ()

  -- Check if the server has a password
  -- If the server has an password, echo it
  if password then
    outputChatBox ( "The server password is " .. password, thePlayer )
  
  -- Else print that there isnt any password
  else
    outputChatBox ( "The server doesn't have any password set", thePlayer )
  end
end

-- Add console command 'viewpassword'
addCommandHandler ( "viewpassword", viewPassword )