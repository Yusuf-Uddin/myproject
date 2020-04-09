local sW, sH = guiGetScreenSize()

local browser = guiCreateBrowser(0, 0, sW, sH, true, false, false)
local theBrowser = guiGetBrowser(browser)
local url = "http://mta/local/login/index.html"

addEventHandler("onClientBrowserCreated", theBrowser,
    function()
        loadBrowserURL(source, url)
        showCursor(true)
    end
)

function adasd()
    destroyElement(browser)
end
addCommandHandler("hallo", adasd)