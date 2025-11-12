function clientResourceStart( )
    progressBar = guiCreateProgressBar( 0.8, 0.8, 0.1, 0.1, true, nil ) --create the gui-progressbar
end
addEventHandler( "onClientResourceStart", resourceRoot, clientResourceStart ) --attach the onClientResourceStart event to a handler with the resource's rootelement(resourceRoot)