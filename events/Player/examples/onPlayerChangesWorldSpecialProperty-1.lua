local cheats = {
    ["hovercars"] = true,
    ["aircars"] = true,
    ["extrabunny"] = true,
    ["extrajump"] = true
}

addEventHandler("onPlayerChangesWorldSpecialProperty", root,
    function(property, enabled)
        if not cheats[property] then
            return
        end

        if not enabled then
            return
        end

        banPlayer(source, false, false, true, "Server", "Time to take a permanent break :-)")
    end
)