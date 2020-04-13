function rolePrefix(msg, msgType)
local admin_rank = getElementData(source, 'admin_rank')
    -- Dont sent the original message
    cancelEvent()

    -- Send message with rank prefix
    if (admin_rank == 'Admin') then
        outputChatBox('#FF0000[ADMIN]'..getPlayerName(source)..' #FFFFFF'..msg, root, 255, 255, 255, true)
    end
end
addEventHandler('onPlayerChat', root, rolePrefix)