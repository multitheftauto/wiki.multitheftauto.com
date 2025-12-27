-- Create a vehicle element
local myObject = Object(1337, 0, 0, 3) -- Create an object with model ID 1337 at position (0, 0, 3)

-- Set the object to be double-sided
myObject.doubleSided = true

-- Check if the object is double-sided
if myObject.doubleSided then
    outputChatBox("The object is double-sided!")
else
    outputChatBox("The object is not double-sided!")
end