-- result is called when the function returns
function result(sum)
    if sum ~= "ERROR" then
        outputChatBox(sum)
    end
end
function addNumbers(number1, number2)
    callRemote ( "http://www.example.com/page.php", result, number1, number2 )
end 
addNumbers ( 123, 456 ) -- call the function