addCommandHandler("length", 
    function (command, ...)
        local input = table.concat({...}, " ")

        if input then
            local length = utf8.len( input )
            outputChatBox( "* Length of your input: ".. length )
        end
    end
)