local sW, sH = guiGetScreenSize()

local browser = guiCreateBrowser(0, 0, sW, sH, true, true, false)
local theBrowser = guiGetBrowser(browser)
local url = "http://mta/local/login/index.html"

addEventHandler("onClientBrowserCreated", theBrowser,
    function()
        loadBrowserURL(source, url)
        showCursor(true)
    end
)

-- Send login data to server
function handleLogin(type, username, password)
    local player = getLocalPlayer()
    triggerServerEvent("handleLogin", root, type, username, password, player)
end
addEvent("onLogin", true)
addEventHandler("onLogin", root, handleLogin)