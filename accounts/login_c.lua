local sW, sH = guiGetScreenSize()

local browser = guiCreateBrowser(0, 0, sW, sH, true, false, false)
local theBrowser = guiGetBrowser(browser)
local url = "http://mta/local/login/index.html"

addEventHandler("onClientBrowserCreated", theBrowser,
    function()
        loadBrowserURL(source, url)
        showCursor(true)
        setCameraMatrix(0, 0, 5, 0, 0, 5)
    end
)

-- Send login data to server
function handleLogin(type, username, password)
    local player = getLocalPlayer()
    triggerServerEvent("handleLogin", root, type, username, password, player)
end
addEvent("onLogin", true)
addEventHandler("onLogin", root, handleLogin)

function successfull()
    destroyElement(browser)
    showCursor(false)
end
addEvent('successfullLogin', true)
addEventHandler('successfullLogin', root, successfull)