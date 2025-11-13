local obj = createObject(971, 0, 0, 3)
setElementID(obj, 'testObj')

idstring = getElementID ( obj  )                   -- get the id of the object
outputChatBox ( "The obket's ID is: " .. idstring ) -- output: The object ID is: testObj