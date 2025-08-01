local handle = fileOpen("code.lua", true)
local hashMD5 = fileGetHash(handle, "md5")
local hashSHA1 = fileGetHash(handle, "sha1")
local hashSHA224 = fileGetHash(handle, "sha224")
local hashSHA256 = fileGetHash(handle, "sha256")
local hashSHA384 = fileGetHash(handle, "sha384")
local hashSHA512 = fileGetHash(handle, "sha512")
local hashHMAC = fileGetHash(handle, "hmac", { algorithm = "sha256", key = "blue apple tree" })
fileClose(handle)

iprint("MD5", hashMD5)
iprint("SHA1", hashSHA1)
iprint("SHA224", hashSHA224)
iprint("SHA256", hashSHA256)
iprint("SHA384", hashSHA384)
iprint("SHA512", hashSHA512)