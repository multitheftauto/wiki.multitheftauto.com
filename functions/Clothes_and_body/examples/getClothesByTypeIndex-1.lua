function scriptNextClothes(thePlayer, key, clothesType)
    local currentTexture, currentModel = getPedClothes(thePlayer, clothesType) -- get the current clothes on this slot
    local clothesIndex = -1
    if (currentTexture) then -- if he had clothes of that type
        local tempA, tempB = getTypeIndexFromClothes(currentTexture, currentModel) -- get the type and index for these clothes, so we can increase it to get the next set in the list
        if (tempA and tempB) then -- if we found them
            clothesType, clothesIndex = tempA, tempB
        end
    end
    clothesIndex = clothesIndex + 1
    local texture, model = getClothesByTypeIndex(clothesType, clothesIndex) -- get the new texture and model
    if (not texture) then -- if we've reached the end of the list
        removePedClothes(thePlayer, clothesType)
    else
        addPedClothes(thePlayer, texture, model, clothesType)
    end
end
addCommandHandler("nextClothes", scriptNextClothes)