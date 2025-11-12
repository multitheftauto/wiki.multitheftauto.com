-- Remote function set with callRemote 'functionName' argument
-- Called from/on remote servers
function outputChatBoxRemote ( playerName, message, type, serverport )
    outputChatBox ( "From " .. playerName .. " on " .. serverport .. ": " .. message )
    return "hello sailor"
end

-- Callback set with callRemote 'callbackFunction' argument
-- Called on the local server when callRemote has completed successfully or with errors
function finishedCallback( responseData, errno )
    responseData = tostring(responseData)
    if responseData == "ERROR" then
        outputDebugString( "callRemote: ERROR #" .. errno )
    elseif responseData ~= "hello sailor" then
        outputDebugString( "callRemote: Unexpected reply: " .. responseData  )
    else
        -- callRemote completed successfully
    end
end

function playerChat ( message, type )
    callRemote ( "play.mtabeta.com:33004", getResourceName(getThisResource()), "outputChatBoxRemote", finishedCallback, getPlayerName(source), message, type, getServerPort() )
    callRemote ( "play.mtabeta.com:33005", getResourceName(getThisResource()), "outputChatBoxRemote", finishedCallback, getPlayerName(source), message, type, getServerPort() )
    callRemote ( "play.mtabeta.com:33006", getResourceName(getThisResource()), "outputChatBoxRemote", finishedCallback, getPlayerName(source), message, type, getServerPort() )
end
addEventHandler ( "onPlayerChat", getRootElement(), playerChat )