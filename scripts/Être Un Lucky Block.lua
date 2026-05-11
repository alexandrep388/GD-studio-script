local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Config farm
local farmActive = false
local farmSpeed = 1
local farmThread = nil

local SAFE_POS     = Vector3.new(731, 39, -2122)
local LAST_BASE_POS = Vector3.new(-611, 49, -2123)

local function getFarmDelay()
    return 0.7 / farmSpeed
end

local function farmLoop()
    while farmActive do
        local char = LocalPlayer.Character
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        local hum  = char and char:FindFirstChild("Humanoid")

        if hrp and hum then
            -- 1. TP au safe spot
            hrp.CFrame = CFrame.new(SAFE_POS)
            task.wait(0.1)

            -- 2. Marche vers CollectZones.base1
            local base1 = workspace:FindFirstChild("CollectZones")
                and workspace.CollectZones:FindFirstChild("base1")
            if base1 then
                hum:MoveTo(base1.Position)
            end

            -- 3. Attendre
            task.wait(getFarmDelay())

            -- 4. TP au last base
            char = LocalPlayer.Character
            hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(LAST_BASE_POS)
            end

            task.wait(0.3 / farmSpeed)
        else
            task.wait(1)
        end
    end
end

-- UI
local Window = Fluent:CreateWindow({
    Title = "Be a Lucky Block Hub",
    SubTitle = "by User",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main     = Window:AddTab({ Title = "Main",      Icon = "house" }),
    Autofarm = Window:AddTab({ Title = "Autofarm",  Icon = "bot" }),
    Autobuy  = Window:AddTab({ Title = "Autobuy",   Icon = "shopping-cart" }),
    Misc     = Window:AddTab({ Title = "Misc",       Icon = "list" })
}

-- ── Autofarm ──────────────────────────────────────────
local FarmSection    = Tabs.Autofarm:AddSection("FARM")
local SettingSection = Tabs.Autofarm:AddSection("SETTING")

FarmSection:AddToggle("AutoFarmToggle", {
    Title   = "Auto farm lucky block",
    Default = false,
    Callback = function(Value)
        farmActive = Value
        if Value then
            farmThread = task.spawn(farmLoop)
        else
            if farmThread then
                task.cancel(farmThread)
                farmThread = nil
            end
        end
    end
})

SettingSection:AddSlider("FarmSpeed", {
    Title    = "Speed of farm",
    Default  = 1,
    Min      = 0.1,
    Max      = 10,
    Rounding = 1,
    Callback = function(Value)
        farmSpeed = Value
    end
})

-- ── Autobuy ───────────────────────────────────────────
Tabs.Autobuy:AddSection("Lucky block")

-- ── Misc ──────────────────────────────────────────────
local RebirthSection = Tabs.Misc:AddSection("Rebirth")

RebirthSection:AddToggle("AutoRebirth", {
    Title   = "Auto rebirth",
    Default = false,
    Callback = function(Value)
        -- logique rebirth ici
    end
})

Window:SelectTab(1)