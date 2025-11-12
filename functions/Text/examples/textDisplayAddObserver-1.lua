function MyTestTextFunction ()
display = textCreateDisplay ()                 -- create a new display, store the reference in a variable called display
textDisplayAddObserver ( display, thePlayer )  -- add an observer to it
text = textCreateTextItem ( "Hello World", 0.5, 0.5, "medium", 255, 0, 0, 255, 2, "left", "top", 255) --red text of 24pt at the center of your screen
textDisplayAddText ( display, text )           -- Add the text item to the text display
end