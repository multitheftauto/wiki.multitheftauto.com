local apiKey = "12345678123456781234567812345678" -- key from ips admin panel
local forumAddress = "https://yourForum.com"
function setPostContent(postID,content)
  local sendOptions = {
    queueName = "updatePost",
    connectionAttempts = 1,
    connectTimeout = 50,
    formFields = {
      post = content,
    },
  }
  fetchRemote( forumAddress.."/api/forums/posts/"..postID.."?key="..apiKey, sendOptions, function()end)
end

setPostContent(1, "this is a first post on this forum")