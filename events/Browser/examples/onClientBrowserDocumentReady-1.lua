addEventHandler ( "onClientBrowserDocumentReady" , root , 
	function ( url ) 
		outputChatBox ( "The page '"  .. url ..  "' has been successfully loaded.") 
	end 
)