function bitnot(thePlayer,cmd,value)

    outputChatBox(bitNot(value),thePlayer)

end

addCommandHandler("bitnot",bitnotFunc)