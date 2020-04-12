--[[ TODO
    CHECK IF PASSWORD MATCHES
    ADD DATA TO PLAYER ON LOGIN AND REGISTER
]]--

function login(type, username, password, player)

    -- Log into Account
    if (type == 'Login') then
        local user = executeSQLQuery("SELECT * FROM userdata")

        -- Check if user exists
        for i, val in pairs(user) do
            if (val.username ~= username) then
                return outputChatBox('user doesnt exist')
            end
        end

    -- Register new Account
    elseif (type == 'Register') then
        local user = executeSQLQuery("SELECT * FROM userdata")

        -- Check if username already exists
        for i, val in pairs(user) do
            if (val.username == username) then
                return outputChatBox('User already exists')
            end
        end
        
        -- Hash the password
        passwordHash(password, 'bcrypt', {}, function(hashedPassword)
            
            -- Create the Account
            executeSQLQuery('INSERT INTO userdata(username, password, money, faction_id, x, y, z, new, faction_rank, ped_id, admin_rank) VALUES(?,?,?,?,?,?,?,?,?,?,?)', username, hashedPassword, 0, 1, 0, 0, 5, 1, 'Citizen', 0, 'User')
            outputChatBox('Account successfully created.', player)

        end)
    end
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)
