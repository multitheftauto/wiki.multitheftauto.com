-- This function tells everyone in the server if someone has numpad 9 bound!
function onPlayerJoin ()
  if (isKeyBound (source,"num_9")) then -- if num pad 9 is bound
    outputChatBox (getPlayerName (source) .. " has bound numpad 9!",getRootElement(),255,0,0,false) -- let see everybody that he has binded it
  end
end
addEventHandler ("onPlayerJoin",getRootElement(),onPlayerJoin) -- add event.