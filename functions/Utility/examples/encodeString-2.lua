local private, public = generateKeyPair("rsa", { size = 2048 })

local input = "Hello, world!"
local encrypted = encodeString("rsa", input, { key = public })
local decrypted = decodeString("rsa", encrypted, { key = private })

outputDebugString("RSA test: ".. tostring(input == decrypted))