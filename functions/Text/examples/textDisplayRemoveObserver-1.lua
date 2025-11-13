display = textCreateDisplay ( ) --create the display
textDisplayAddObserver ( display, thePlayer ) --add an observer
newtextitem = textCreateTextItem ( "Hello World", 0.5, 0.5, "low", 255, 0, 0, 0, 1.0 ) --create our "Hello World" text item
textDisplayAddText ( display, newtextitem ) --add this to the display
setTimer ( textDisplayRemoveObserver, 5000,1, display, thePlayer ) --set a timer to remove this 5 seconds later.