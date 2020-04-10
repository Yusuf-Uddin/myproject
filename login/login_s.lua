function login(type, username, password)

    -- Log into Account
    if (type == 'Login') then

    -- Register new Account
    elseif (type == 'Register') then

        -- Check if username already exists
        if getAccount(username) then
            return outputChatBox('Username already in use.')
        end
        
        -- Hash the password
        passwordHash(password, 'bcrypt', {}, function(hashedPassword)
            
            -- Create the account
            local account = addAccount(username, hashedPassword)
            setAccountData(account, 'hashed_password', hashedPassword)
            dbExec(connection, 'INSERT INTO userdata (username, password, money, faction_id, x, y, z, new) VALUES(?,?,?,?,?,?,?,?)', username, hashedPassword, 0, 1, 0, 0, 5, true)
            outputChatBox('Account successfully created.')

        end)
    end
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)