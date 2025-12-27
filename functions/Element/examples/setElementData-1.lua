function addPlayerCustomTag(thePlayer, command, newTag)
    -- Let's make sure the newTag param has been entered...
    if (newTag) then
        -- Grab their current playername for saving.
        local sPlayerNickname = getPlayerName(thePlayer)
        -- Create their new nickname with their tag
        local sNewPlayerNickname = newTag .. " " .. sPlayerNickname

        -- Let's first load the element data, see if it's there already
        -- The reason for this is that if a player were to do /addtag twice,
        -- the tag would be prepended a second time
        local sOldNick = getElementData(thePlayer, "tempdata.originalnick")
        if (sOldNick == false) then
            -- Save their orignal nickname in their element data
            setElementData(thePlayer, "tempdata.originalnick", sPlayerNickname)
        end

        -- Set their new nickname globally
        setPlayerName(thePlayer, sNewPlayerNickname)

        -- Tell them it's done
        outputChatBox("Your new nickname has been set, to put it back to its original state you can use /deltag", thePlayer)
    else
        -- The newTag param was not entered, give an error message
        outputChatBox("/addtag - Incorrect syntax, Correct: /addtag <newtag>", thePlayer)
    end
end
addCommandHandler("addtag", addPlayerCustomTag)

function removePlayerCustomTag(thePlayer, command)
    -- We first need to check that they have already used /addtag, let's do that now
    local sOldNick = getElementData(thePlayer, "tempdata.originalnick")
    if (sOldNick) then
        -- Great, they have a tag added, let's reset them

        -- First we will want to reset the element data back to its default (that being false)
        setElementData(thePlayer, "tempdata.originalnick", false)

        -- Now set the client name back
        setPlayerName(thePlayer, sOldNick)

        -- Notify them
        outputChatBox("Your old nickname has been set", thePlayer)
    end
end
addCommandHandler("deltag", removePlayerCustomTag)
