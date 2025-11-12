function givePoint ( thePlayer )
    local scoretextitem = scoretextitems[thePlayer]    -- find the score text item that belongs to this player
    local score = textItemGetText ( scoretextitem )    -- read the text (a score number)
    score = tostring(tonumber(score) + 1)              -- convert to number, add 1, convert to text
    textItemSetText ( scoretextitem, score )           -- put the new score on the text item
end