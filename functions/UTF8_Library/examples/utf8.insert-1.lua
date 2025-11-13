addCommandHandler("insert", 
    function (player, command, word)
        if word then
            local output = utf8.insert( "hello ", word )
            outputChatBox( output, player )
            
            local output = utf8.insert( "hello ", utf8.len( "hello " ) + 1, word )
            outputChatBox( output, player )
        end
    end
)