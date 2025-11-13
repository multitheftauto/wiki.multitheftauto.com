function onStart()
  button = guiCreateButton( 20, 200, 150, 30, "Test", false )
end
addEventHandler( "onClientResourceStart", resourceRoot, onStart )

function toogleButton()
  local currentState = guiGetProperty( button, "Disabled" )
  if currentState == "False" then
    guiSetProperty( button, "Disabled", "True" )
  else
    guiSetProperty( button, "Disabled", "False" )
  end
end
addCommandHandler( "togglebtn", toogleButton )