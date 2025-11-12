dbQuery( function(qh, tag, score)
            local result = dbPoll( qh, 0 )   -- Timeout doesn't matter here because the result will always be ready
            outputDebugString( tag )         -- Prints "hello"
            outputDebugString( score )       -- Prints 2000
         end
         ,{"hello",2000}, connection, "SELECT * FROM table_name" )