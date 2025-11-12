-- the function is called on resource start
function onThisResourceStart ( )
    downloadFile ( "test.xml" )
end
addEventHandler ( "onClientResourceStart", resourceRoot, onThisResourceStart )