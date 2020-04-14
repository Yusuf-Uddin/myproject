local admin_ranks = {
    ['Admin'] = '#FF0000',
    ['Developer'] = '#FF0010',
    ['Moderator'] = '#FF0010',
    ['Supporter'] = '#FF0010'
}

function rolePrefix(msg, msgType)
local admin_rank = getElementData(source, 'admin_rank')

    -- Dont sent the original message
    cancelEvent()

    -- Send message with rank prefix
    for i, v in pairs(admin_ranks) do
        if (i == admin_rank) then
            local uppercaseRank = string.upper(i)
            outputChatBox(v..'['..uppercaseRank..']#FFFFFF'..getPlayerName(source)..': #FFFFFF'..msg, root, 255, 255, 255, true)
            break
        else
            outputChatBox('#FFFFFF'..getPlayerName(source)..': '..msg, root, 255, 255, 255, true)
        end
    end
end
addEventHandler('onPlayerChat', root, rolePrefix)