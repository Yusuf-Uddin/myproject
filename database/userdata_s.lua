local keys = {
    [1] = "username",
    [2] = "password",
    [3] = "money",
    [4] = "faction_id",
    [5] = "x",
    [6] = "y",
    [7] = "z",
    [8] = "new"
}

local username = {}
local password = {}
local money = {}
local faction_id = {}
local x = {}
local y = {}
local z = {}
local new = {}

function ravenSetElementData(source, key, data)
    for i, k in ipairs(keys) do
        if (key ~= k) then
            outputDebugString('Please use an available key.', 3, 255, 0, 0)
            break
        else
            if (key == 'username') then
                username[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'password') then
                password[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'money') then
                money[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'faction_id') then
                faction_id[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'x') then
                x[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'y') then
                y[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'z') then
                z[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            elseif (key == 'new') then
                new[source] = data
                outputDebugString('Successfully inserted userdata into table.', 3, 0, 255, 0)
                break
            end
        end
    end
end

function ravenGetElementData(source, key)
    for i, k in ipairs(keys) do
        if (key ~= k) then
            outputDebugString('Please use an available key.', 3, 255, 0, 0)
            break
        else
            if (key == 'username') then
                return username[source]
            elseif (key == 'password') then
                return password[source]
            elseif (key == 'money') then
                return money[source]
            elseif (key == 'faction_id') then
                return faction_id[source]
            elseif (key == 'x') then
              return x[source]
            elseif (key == 'y') then
              return y[source]
            elseif (key == 'z') then
              return z[source]
            elseif (key == 'new') then
                return new[source]
            end
        end
    end
end