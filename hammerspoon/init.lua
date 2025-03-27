local open_app_func = function(appName)
    return function()
        local app = hs.application.get(appName)

        if app == nil or app:isHidden() or not(app:isFrontmost()) then
            hs.application.launchOrFocus(appName)
        else
            app:hide()
        end
    end
end

hs.hotkey.bind({"cmd"}, "/", open_app_func("Ghostty"))
hs.hotkey.bind({"cmd", "shift"}, "/", open_app_func("ChatGPT"))
