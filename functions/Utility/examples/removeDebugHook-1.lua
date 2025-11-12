function onPreEvent( sourceResource, eventName, eventSource, eventClient, luaFilename, luaLineNumber, ... )
end
addDebugHook( "preEvent", onPreEvent )
removeDebugHook( "preEvent", onPreEvent )