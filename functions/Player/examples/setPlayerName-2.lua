function isNicknameValid(nick)
  for _, codepoint in utf8.next, nick do
    if(codepoint < 33 or codepoint > 126)then
      return false
    end
  end
  return true
end