function login(type, username, password, player)
    local user = executeSQLQuery("SELECT * FROM userdata")

    -- Log into Account
    if (type == 'Login') then

        -- Check if user exists
        for i, val in pairs(user) do
            if (val.username == username) then

                -- Check if password matches
                if not (passwordVerify(password, val.password)) then
                    return outputChatBox('Wrong password', player)
                end

                -- Log player into his account
                outputChatBox('Successfully logged in.', player)
                setElementData(player, 'username', val.username)
                setElementData(player, 'password', val.password)
                setElementData(player, 'money', val.money)
                setElementData(player, 'faction_id', val.faction_id)
                setElementData(player, 'x', val.x)
                setElementData(player, 'y', val.y)
                setElementData(player, 'z', val.z)
                setElementData(player, 'new', val.new)
                setElementData(player, 'faction_rank', val.faction_rank)
                setElementData(player, 'ped_id', val.ped_id)
                setElementData(player, 'admin_rank', val.admin_rank)
                setPedSkin(player, val.ped_id)
                break
            else
                return outputChatBox('Wrong username', player)
            end
        end

    -- Register new Account
    elseif (type == 'Register') then

        -- Check if username already exists
        for i, val in pairs(user) do
            if (val.username == username) then
                return outputChatBox('User already exists', player)
            end
        end
        
        -- Hash the password
        passwordHash(password, 'bcrypt', {}, function(hashedPassword)
            
            -- Create the Account
            executeSQLQuery('INSERT INTO userdata(username, password, money, faction_id, x, y, z, new, faction_rank, ped_id, admin_rank) VALUES(?,?,?,?,?,?,?,?,?,?,?)', username, hashedPassword, 0, 1, 0, 0, 5, 1, 'Citizen', 0, 'User')
            outputChatBox('Account successfully created.', player)
            setElementData(player, 'username', username)
            setElementData(player, 'password', hashedPassword)
            setElementData(player, 'money', 0)
            setElementData(player, 'faction_id', 1)
            setElementData(player, 'x', 0)
            setElementData(player, 'y', 0)
            setElementData(player, 'z', 5)
            setElementData(player, 'new', 1)
            setElementData(player, 'faction_rank', 'Citizen')
            setElementData(player, 'ped_id', 0)
            setElementData(player, 'admin_rank', 'User')
        end)
    end
end
addEvent("handleLogin", true)
addEventHandler("handleLogin", getRootElement(), login)