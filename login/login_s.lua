function login(type, username, password, player)
    local account = getAccount(username, password)

    -- Log into Account
    if (type == 'Login') then
        
        -- Check if Account exists
        if (account ~= false) then

            -- Login
            logIn(player, account, password)
        else

            -- Tell user to register
            outputChatBox('User doesnt exist please register.', player)
        end

    -- Register new Account
    elseif (type == 'Register') then

        -- Check if username already exists
        if (account ~= false) then
            return outputChatBox('Username already in use.', player)
        end
        
        -- Hash the password
        passwordHash(password, 'bcrypt', {}, function(hashedPassword)
            
            -- Create the Account
            local account = addAccount(username, hashedPassword)
            setElementData(player, 'username', username)
            setElementData(player, 'password', password)
            setElementData(player, 'money', 0)
            setElementData(player, 'faction_id', 1)
            setElementData(player, 'x', 0)
            setElementData(player, 'y', 0)
            setElementData(player, 'z', 5)
            setElementData(player, 'new', true)
            dbExec(connection, 'INSERT INTO userdata (username, password, money, faction_id, x, y, z, new) VALUES(?,?,?,?,?,?,?,?)', username, hashedPassword, 0, 1, 0, 0, 5, true)
            outputChatBox('Account successfully created.', player)
            logIn()
        end)
    end
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)