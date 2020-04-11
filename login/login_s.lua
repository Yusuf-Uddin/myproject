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
            ravenSetElementData(player, 'username', username)
            ravenSetElementData(player, 'password', password)
            ravenSetElementData(player, 'money', 0)
            ravenSetElementData(player, 'faction_id', 1)
            ravenSetElementData(player, 'x', 0)
            ravenSetElementData(player, 'y', 0)
            ravenSetElementData(player, 'z', 5)
            ravenSetElementData(player, 'new', 1)
            dbExec(connection, 'INSERT INTO userdata (username, password, money, faction_id, x, y, z, new) VALUES(?,?,?,?,?,?,?,?,?,?,?)', username, hashedPassword, 0, 1, 0, 0, 5, 1, 'Citizen', 0, 'User')
            outputChatBox('Account successfully created.', player)
        end)

        -- Login after registering
        logIn(player, account, password)
    end
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)