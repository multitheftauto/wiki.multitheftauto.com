function deathMessageOnWasted ( ammo, attacker, weapon, bodypart )
  if ( attacker ) then                                    -- if we have an attacker
    if ( getElementType ( attacker ) == "player" ) then   -- make sure the element that killed him was a player
      tempString = getPlayerName ( attacker ) .. " killed " .. getPlayerName ( source ) .. " (" .. getWeaponNameFromID ( weapon ) .. ")"
      if ( bodypart == 9 ) then -- if he was shot in the head
        tempString = tempString .. " (HEADSHOT!)"
      else
        tempString = tempString .. " (" .. getBodyPartName ( bodypart ) .. ")"
      end
      outputChatBox ( tempString )
    else
      outputChatBox ( getPlayerName ( source ) .. " died. (" .. getWeaponNameFromID ( weapon ) .. ") (" .. getBodyPartName ( bodypart ) .. ")" )
    end
  else
    outputChatBox ( getPlayerName ( source ) .. " died. (" .. getWeaponNameFromID ( weapon ) .. ") (" .. getBodyPartName ( bodypart ) .. ")" )
  end
end
addEventHandler ( "onPlayerWasted", root, deathMessageOnWasted )