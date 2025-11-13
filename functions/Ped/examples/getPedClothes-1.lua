function getClothes ( source, key, clothesType )
    local texture, model = getPedClothes ( source, clothesType )
    if ( texture and model ) then
        outputChatBox ( getPlayerName(source) .. " is wearing " .. texture .. " " .. model ..
                        " on his " .. getClothesTypeName(clothesType), source )
    else
        outputChatBox ( "Invalid input.", source )
    end
end
addCommandHandler ( "clothes", getClothes )