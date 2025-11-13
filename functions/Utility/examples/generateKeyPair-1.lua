addCommandHandler("generatekeypair", 
    function(player, _, algorithm, keysize)
        if algorithm then
            if keysize and tonumber(keysize) then
                local privateKey, publicKey = generateKeyPair( algorithm, { size = keysize } )
                if not privateKey then
                    outputChatBox("Failed to generate key pair. Make sure that all arguments are valid.", player, 255, 0, 0)
                else
                    outputConsole("Private Key: " .. base64Encode(privateKey),player)
                    outputConsole("Public Key: " .. base64Encode(publicKey),player)
                    outputChatBox("The key pair was successfully generated. You can find the result in the console.", player, 0, 255, 0)
                end
            else
                outputChatBox("Please specify key size in the command.", player, 255, 0, 0)
            end
        else
            outputChatBox("Please specify algorithm in the command.", player, 255, 0, 0)
        end
    end
)