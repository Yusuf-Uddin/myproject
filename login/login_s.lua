function login(type, username, password)

    -- Log into Account
    if (type == 'Login') then

    -- Register new Account
    elseif (type == 'Register') then

    end
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)