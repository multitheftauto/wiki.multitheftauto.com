function getClothes ( thePlayer, key, clothesType )
  local texture, model = getPedClothes ( source, clothesType )
  if ( texture and model ) then
    outputChatBox ( getPlayerName ( thePlayer ) .. " is wearing " .. texture .. " " .. model .. " on his " .. getClothesTypeName ( clothesType ) )
  end
end
addCommandHandler ( "clothes", getClothes )