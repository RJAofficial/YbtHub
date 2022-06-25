-- Constants:
local YbtHubRepository = "https://github.com/RJAofficial/YbtHub/blob/master/"
local LinoriaUILibrary = loadstring(game:HttpGet(YbtHubRepository .. "Libraries/LinoriaUILibrary.lua"))
local ThemeManager = loadstring(game:HttpGet(YbtHubRepository .. "Managers/ThemeManager.lua"))
local SaveManager = loadstring(game:HttpGet(YbtHubRepository .. "Managers/SaveManager.lua"))


-- Module:
local GUIManager = {
    LinoriaUILibrary = LinoriaUILibrary,
    ThemeManager = ThemeManager,
    SaveManager = SaveManager
}

function GUIManager:setup(title, gameFolder)
    local Window = LinoriaUILibrary:CreateWindow({
        Title = tostring(title),
        Center = true,
        AutoShow = true
    })

    local UISettings = Window:AddTab("UI Settings")
    local MenuGroupbox = UISettings:AddLeftGroupbox("Menu")

    MenuGroupbox:AddButton("Unload", function()
        LinoriaUILibrary:Unload()
    end)

    MenuGroupbox:AddLabel("Toggle GUI"):AddKeyPicker("ToggleGUIKeybind", {
        Default = "RightControl",
        NoUI = true,
        Text = "Toggle GUI Bind"
    })

    LinoriaUILibrary.ToggleKeybind = Options.ToggleGUIKeybind

    ThemeManager:SetLibrary(LinoriaUILibrary)
    SaveManager:SetLibrary(LinoriaUILibrary)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({"ToggleGUIKeybind"})

    ThemeManager:SetFolder("YbtHub")
    SaveManager:SetFolder("YbtHub/" .. tostring(gameFolder))

    SaveManager:BuildConfigSection(UISettings)
    ThemeManager:ApplyToTab(UISettings)

    return Window, UISettings
end

return GUIManager