-- set timer output text in chat box
local Timer = setTimer ( function ( ) outputChatBox ( 'Hello World !' ) end, 60000, 0 )
-- Check the timer then kill the timer
if isTimer ( Timer ) then killTimer ( Timer ) end