sendOptions = {
    queueName = "My Mailgun queue",
    connectionAttempts = 3,
    connectTimeout = 5000,
    formFields = {
        from="Excited User <[email protected]>",
        to="[email protected]",
        subject="Hello",
        text="Testing some Mailgun awesomness!",
    },
    username="api",
    password="key-3ax6xnjp29jd6fds4gc373sgvjxteol0",
}
fetchRemote( "https://api.mailgun.net/v3/samples.mailgun.org/messages", sendOptions, mailgunCompleteCallback )

function mailgunCompleteCallback(data, info)
    outputDebugString( "mailgunComplete"
            .. " success:" .. tostring(info.success)
            .. " statusCode:" .. tostring(info.statusCode)
            .. " data:" .. tostring(data)
            )
end