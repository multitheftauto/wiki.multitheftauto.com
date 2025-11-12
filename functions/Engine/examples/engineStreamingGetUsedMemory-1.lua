addEventHandler ("onClientResourceStart", resourceRoot,
    function ()
        outputChatBox ("Used memory by the GTA streamer: "..engineStreamingGetUsedMemory ()..".")
    end
)