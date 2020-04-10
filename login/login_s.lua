function login(type, username, password)

    -- Log into Account
    outputChatBox(type.." "..username.." "..password, root)

    -- Register new Account
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)