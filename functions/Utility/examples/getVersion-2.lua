function showVersion()
    -- We use a for loop to dump the output into player chatbox
    outputChatBox("Version information (Client):", 0, 255, 0)
    for ind, dat in pairs(getVersion()) do
        -- Uppercasing first letter too
        outputChatBox(string.upper(string.sub(ind, 1, 1))..string.sub(ind, 2)..": "..dat, 0, 255, 0)
    end
end
addCommandHandler("version", showVersion) -- Define our command handler