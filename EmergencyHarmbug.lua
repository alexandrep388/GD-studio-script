-- ╔══════════════════════════════════════════════════════════╗
-- ║          GD Studio  ·  Emergency Harmbug                ║
-- ║          github.com/alexandrep388                       ║
-- ╚══════════════════════════════════════════════════════════╝

-- ─────────────────────────────────────────────────────────
--  SERVICES
-- ─────────────────────────────────────────────────────────
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")

local LP     = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ─────────────────────────────────────────────────────────
--  ORION  — essaie plusieurs URLs dont ton propre repo
-- ─────────────────────────────────────────────────────────
local OrionLib
local _orionURLs = {
    "https://raw.githubusercontent.com/alexandrep388/Garden-horizons-/refs/heads/main/OrionLib.lua",
    "https://raw.githubusercontent.com/shlexware/Orion/main/source",
    "https://raw.githubusercontent.com/jensonhirst/Orion/main/source",
}
for _, _url in ipairs(_orionURLs) do
    local _ok, _res = pcall(function()
        return loadstring(game:HttpGet(_url, true))()
    end)
    if _ok and type(_res) == "table" and _res.MakeWindow then
        OrionLib = _res
        break
    end
end
assert(OrionLib, "[GD Studio] Orion failed to load — upload OrionLib.lua to your repo first!")

-- ─────────────────────────────────────────────────────────
--  SON  137402801272072
-- ─────────────────────────────────────────────────────────
local SFX    = Instance.new("Sound")
SFX.SoundId  = "rbxassetid://137402801272072"
SFX.Volume   = 0.65
SFX.Parent   = LP:WaitForChild("PlayerGui")
local function sfx() SFX.TimePosition = 0 SFX:Play() end

-- ─────────────────────────────────────────────────────────
--  NOTIFY
-- ─────────────────────────────────────────────────────────
local function Notify(title, content)
    sfx()
    OrionLib:MakeNotification({
        Name    = title,
        Content = content,
        Image   = "rbxassetid://4483345875",
        Time    = 3,
    })
end

-- ─────────────────────────────────────────────────────────
--  LANGUES
-- ─────────────────────────────────────────────────────────
local LANGS = {
    EN = {
        tabP="Principal", tabV="Véhicule", tabPol="Police", tabO="Other", tabM="Misc",
        secMove="Movement", secTeams="Team ESP", secVis="Visual Options", secAim="Aimbot",
        infSt="Infinite Stamina",   aFall="Anti Fall",
        langBtn="Language: ",
        espPolice="Police ESP",     espPrisoner="Prisoner ESP",
        espFire="Fire Dept ESP",    espHARS="HARS ESP",   espTruck="Truck Co. ESP",
        espHL="Highlight",          espTr="Tracers",      espNm="Player Names",
        aOn="Aimbot",               silAim="Silent Aim",  aTarget="Target Part",
        aFov="FOV Radius",          aSmth="Smoothness",   aPred="Prediction",
        aCol="FOV Color",
        notifOn="→ Enabled",        notifOff="→ Disabled",
        loaded="Emergency Harmbug loaded ✓",
    },
    FR = {
        tabP="Principal", tabV="Véhicule", tabPol="Police", tabO="Other", tabM="Misc",
        secMove="Mouvement", secTeams="ESP Équipes", secVis="Options Visuelles", secAim="Aimbot",
        infSt="Stamina Infinie",    aFall="Anti Chute",
        langBtn="Langue: ",
        espPolice="ESP Police",     espPrisoner="ESP Prisonnier",
        espFire="ESP Pompiers",     espHARS="ESP HARS",   espTruck="ESP Camionnage",
        espHL="Surbrillance",       espTr="Traceurs",     espNm="Noms Joueurs",
        aOn="Aimbot",               silAim="Silent Aim",  aTarget="Partie Cible",
        aFov="Rayon FOV",           aSmth="Fluidité",     aPred="Prédiction",
        aCol="Couleur FOV",
        notifOn="→ Activé",         notifOff="→ Désactivé",
        loaded="Emergency Harmbug chargé ✓",
    },
    ES = {
        tabP="Principal", tabV="Vehículo", tabPol="Policía", tabO="Otros", tabM="Misc",
        secMove="Movimiento", secTeams="ESP Equipos", secVis="Opciones Visuales", secAim="Aimbot",
        infSt="Stamina Infinita",   aFall="Anti Caída",
        langBtn="Idioma: ",
        espPolice="ESP Policía",    espPrisoner="ESP Prisionero",
        espFire="ESP Bomberos",     espHARS="ESP HARS",   espTruck="ESP Camioneros",
        espHL="Resaltado",          espTr="Trazadores",   espNm="Nombres",
        aOn="Aimbot",               silAim="Silent Aim",  aTarget="Parte Objetivo",
        aFov="Radio FOV",           aSmth="Suavidad",     aPred="Predicción",
        aCol="Color FOV",
        notifOn="→ Activado",       notifOff="→ Desactivado",
        loaded="Emergency Harmbug cargado ✓",
    },
    PT = {
        tabP="Principal", tabV="Veículo", tabPol="Polícia", tabO="Outros", tabM="Misc",
        secMove="Movimento", secTeams="ESP Equipes", secVis="Opções Visuais", secAim="Aimbot",
        infSt="Stamina Infinita",   aFall="Anti Queda",
        langBtn="Idioma: ",
        espPolice="ESP Polícia",    espPrisoner="ESP Prisioneiro",
        espFire="ESP Bombeiros",    espHARS="ESP HARS",   espTruck="ESP Caminhoneiros",
        espHL="Destaque",           espTr="Tracers",      espNm="Nomes",
        aOn="Aimbot",               silAim="Silent Aim",  aTarget="Parte Alvo",
        aFov="Raio FOV",            aSmth="Suavidade",    aPred="Predição",
        aCol="Cor FOV",
        notifOn="→ Ativado",        notifOff="→ Desativado",
        loaded="Emergency Harmbug carregado ✓",
    },
    DE = {
        tabP="Haupt", tabV="Fahrzeug", tabPol="Polizei", tabO="Andere", tabM="Misc",
        secMove="Bewegung", secTeams="Team-ESP", secVis="Visuelle Optionen", secAim="Aimbot",
        infSt="Unendl. Stamina",    aFall="Anti-Fall",
        langBtn="Sprache: ",
        espPolice="ESP Polizei",    espPrisoner="ESP Gefangener",
        espFire="ESP Feuerwehr",    espHARS="ESP HARS",   espTruck="ESP LKW-Firma",
        espHL="Hervorhebung",       espTr="Tracer",       espNm="Spielernamen",
        aOn="Aimbot",               silAim="Silent Aim",  aTarget="Zielteil",
        aFov="FOV-Radius",          aSmth="Glättung",     aPred="Vorhersage",
        aCol="FOV-Farbe",
        notifOn="→ Aktiviert",      notifOff="→ Deaktiviert",
        loaded="Emergency Harmbug geladen ✓",
    },
}
local LANG_ORDER = {"EN","FR","ES","PT","DE"}
local LANG_FLAG  = {EN="🇬🇧",FR="🇫🇷",ES="🇪🇸",PT="🇧🇷",DE="🇩🇪"}

local FOLDER = "GDStudio_EHarmbug"
pcall(function() if not isfolder(FOLDER) then makefolder(FOLDER) end end)

local currentLang = "EN"
pcall(function()
    local s = readfile(FOLDER.."/language.txt")
    if LANGS[s] then currentLang = s end
end)
local L = LANGS[currentLang]

local function cycleLang()
    local idx = 1
    for i,c in ipairs(LANG_ORDER) do if c==currentLang then idx=i break end end
    currentLang = LANG_ORDER[(idx % #LANG_ORDER) + 1]
    L = LANGS[currentLang]
    pcall(function() writefile(FOLDER.."/language.txt", currentLang) end)
    Notify("🌐 Language", LANG_FLAG[currentLang].." "..currentLang.." — reload to apply")
end

-- ─────────────────────────────────────────────────────────
--  STATE
-- ─────────────────────────────────────────────────────────
local S = {
    infStamina = false,
    antiFall   = false,
    espHL      = true,
    espTr      = false,
    espNm      = false,
    esp = {
        Police=false, Prisoner=false, FireDepartment=false,
        HARS=false, TruckCompany=false,
    },
    aimbot     = false,
    silentAim  = false,
    aTarget    = "Head",
    aFov       = 150,
    aSmooth    = 5,
    aPred      = 0,
    aColor     = Color3.fromRGB(255, 60, 60),
}

local TEAM_COL = {
    Police         = Color3.fromRGB(30,  110, 255),
    Prisoner       = Color3.fromRGB(255, 140,   0),
    FireDepartment = Color3.fromRGB(220,  30,  30),
    HARS           = Color3.fromRGB(230, 230,  80),
    TruckCompany   = Color3.fromRGB(215, 215, 215),
}

-- ─────────────────────────────────────────────────────────
--  FENÊTRE
-- ─────────────────────────────────────────────────────────
local Window = OrionLib:MakeWindow({
    Name         = "GD Studio  ·  Emergency Harmbug",
    HidePremium  = true,
    SaveConfig   = false,
    IntroEnabled = true,
    IntroText    = "GD Studio",
    IntroIcon    = "rbxassetid://4483345875",
})

-- ══════════════════════════════════════════════════════════
--  TAB 1 : PRINCIPAL
-- ══════════════════════════════════════════════════════════
local TabP = Window:MakeTab({Name=L.tabP, Icon="rbxassetid://4483345875", PremiumOnly=false})

TabP:AddSection({Name="🌐 Language"})
TabP:AddButton({
    Name     = L.langBtn .. LANG_FLAG[currentLang] .. " " .. currentLang,
    Callback = cycleLang,
})

TabP:AddSection({Name=L.secMove})
TabP:AddToggle({
    Name     = L.infSt,
    Default  = false,
    Callback = function(v)
        S.infStamina = v
        sfx()
        Notify(L.infSt, v and L.notifOn or L.notifOff)
    end,
})
TabP:AddToggle({
    Name     = L.aFall,
    Default  = false,
    Callback = function(v)
        S.antiFall = v
        sfx()
        Notify(L.aFall, v and L.notifOn or L.notifOff)
    end,
})

-- ══════════════════════════════════════════════════════════
--  TAB 2 : VÉHICULE
-- ══════════════════════════════════════════════════════════
local TabV = Window:MakeTab({Name=L.tabV, Icon="rbxassetid://4483345875", PremiumOnly=false})
TabV:AddSection({Name=L.tabV})
TabV:AddButton({
    Name="Coming Soon",
    Callback=function() Notify("Véhicule","Coming soon!") end
})

-- ══════════════════════════════════════════════════════════
--  TAB 3 : POLICE
-- ══════════════════════════════════════════════════════════
local TabPol = Window:MakeTab({Name=L.tabPol, Icon="rbxassetid://4483345875", PremiumOnly=false})

TabPol:AddSection({Name="Police ESP"})
TabPol:AddToggle({
    Name     = L.espPolice,
    Default  = false,
    Callback = function(v) S.esp.Police=v sfx() end,
})

TabPol:AddSection({Name=L.secVis})
TabPol:AddToggle({Name=L.espHL, Default=true,  Callback=function(v) S.espHL=v sfx() end})
TabPol:AddToggle({Name=L.espTr, Default=false, Callback=function(v) S.espTr=v sfx() end})
TabPol:AddToggle({Name=L.espNm, Default=false, Callback=function(v) S.espNm=v sfx() end})

-- ══════════════════════════════════════════════════════════
--  TAB 4 : OTHER
-- ══════════════════════════════════════════════════════════
local TabO = Window:MakeTab({Name=L.tabO, Icon="rbxassetid://4483345875", PremiumOnly=false})

TabO:AddSection({Name=L.secTeams})
TabO:AddToggle({Name=L.espPrisoner, Default=false, Callback=function(v) S.esp.Prisoner=v       sfx() end})
TabO:AddToggle({Name=L.espFire,     Default=false, Callback=function(v) S.esp.FireDepartment=v sfx() end})
TabO:AddToggle({Name=L.espHARS,     Default=false, Callback=function(v) S.esp.HARS=v           sfx() end})
TabO:AddToggle({Name=L.espTruck,    Default=false, Callback=function(v) S.esp.TruckCompany=v   sfx() end})

-- ══════════════════════════════════════════════════════════
--  TAB 5 : MISC  (AIMBOT)
-- ══════════════════════════════════════════════════════════
local TabM = Window:MakeTab({Name=L.tabM, Icon="rbxassetid://4483345875", PremiumOnly=false})

TabM:AddSection({Name=L.secAim})
TabM:AddToggle({
    Name     = L.aOn,
    Default  = false,
    Callback = function(v)
        S.aimbot=v sfx()
        Notify(L.aOn, v and L.notifOn or L.notifOff)
    end,
})
TabM:AddToggle({
    Name     = L.silAim,
    Default  = false,
    Callback = function(v)
        S.silentAim=v sfx()
        Notify(L.silAim, v and L.notifOn or L.notifOff)
    end,
})
TabM:AddDropdown({
    Name     = L.aTarget,
    Default  = "Head",
    Options  = {"Head", "Torso", "HumanoidRootPart"},
    Callback = function(v) S.aTarget=v sfx() end,
})
TabM:AddSlider({
    Name      = L.aFov,
    Min       = 30, Max=700, Default=150,
    Color     = Color3.fromRGB(255,60,60),
    Increment = 5,
    Callback  = function(v) S.aFov=v end,
})
TabM:AddSlider({
    Name      = L.aSmth,
    Min       = 1, Max=30, Default=5,
    Color     = Color3.fromRGB(52,211,153),
    Increment = 1,
    Callback  = function(v) S.aSmooth=v end,
})
TabM:AddSlider({
    Name      = L.aPred,
    Min       = 0, Max=30, Default=0,
    Color     = Color3.fromRGB(255,200,50),
    Increment = 1,
    Callback  = function(v) S.aPred=v end,
})
TabM:AddColorpicker({
    Name     = L.aCol,
    Default  = Color3.fromRGB(255,60,60),
    Callback = function(v) S.aColor=v end,
})

-- ─────────────────────────────────────────────────────────
--  INIT
-- ─────────────────────────────────────────────────────────
OrionLib:Init()

task.spawn(function()
    task.wait(1)
    Notify("GD Studio", L.loaded)
end)

-- ══════════════════════════════════════════════════════════
--  LOGIQUE : INFINITE STAMINA
--  Cherche toutes les instances via getgc + hook + rawset
-- ══════════════════════════════════════════════════════════
task.spawn(function()
    task.wait(5)
    local instances = {}

    -- getgc pour trouver l'objet stamina en mémoire
    pcall(function()
        for _, v in ipairs(getgc(true)) do
            if type(v) == "table" then
                local s = rawget(v, "stamina")
                local h = rawget(v, "hasStaminaBoost")
                if type(s) == "number" and type(h) == "boolean" then
                    table.insert(instances, v)

                    -- Hook useStamina → toujours retourne true
                    local mt  = getmetatable(v) or v
                    local key = nil
                    for k, fn in pairs(mt) do
                        if k == "useStamina" and type(fn) == "function" then key=k break end
                    end
                    if key then
                        local orig = mt[key]
                        mt[key] = function(self, amount)
                            if S.infStamina then return true end
                            return orig(self, amount)
                        end
                    end

                    -- Hook setStamina → force à 1
                    for k, fn in pairs(mt) do
                        if k == "setStamina" and type(fn) == "function" then
                            local orig2 = fn
                            mt[k] = function(self, val)
                                if S.infStamina then return orig2(self, 1) end
                                return orig2(self, val)
                            end
                            break
                        end
                    end
                end
            end
        end
    end)

    -- Heartbeat : rawset stamina=1 + fallback attribut
    RunService.Heartbeat:Connect(function()
        if not S.infStamina then return end

        for _, inst in ipairs(instances) do
            pcall(function() rawset(inst, "stamina", 1) end)
        end

        -- Fallback attribut Humanoid
        local char = LP.Character
        if not char then return end
        pcall(function()
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            for _, a in ipairs({"Stamina","stamina","STAMINA"}) do
                if hum:GetAttribute(a) ~= nil then
                    hum:SetAttribute(a, 1)
                end
            end
            local sv = hum:FindFirstChild("Stamina") or hum:FindFirstChild("stamina")
            if sv and sv:IsA("NumberValue") then sv.Value = 1 end
        end)
    end)
end)

-- ══════════════════════════════════════════════════════════
--  LOGIQUE : ANTI FALL
-- ══════════════════════════════════════════════════════════
local fallBV = nil

local function cleanFall()
    pcall(function() if fallBV and fallBV.Parent then fallBV:Destroy() end end)
    fallBV = nil
end

LP.CharacterRemoving:Connect(cleanFall)

RunService.Heartbeat:Connect(function()
    if not S.antiFall then cleanFall() return end

    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    local vel      = hrp.AssemblyLinearVelocity
    local state    = hum:GetState()
    local falling  = vel.Y < -22
        or state == Enum.HumanoidStateType.Freefall
        or state == Enum.HumanoidStateType.FallingDown

    if falling and vel.Y < -22 then
        if not fallBV or not fallBV.Parent then
            fallBV          = Instance.new("BodyVelocity")
            fallBV.MaxForce = Vector3.new(0, math.huge, 0)
            fallBV.P        = 1e5
            fallBV.Parent   = hrp
        end
        -- Freine la chute vers -8 studs/s (seuil sans dégâts)
        fallBV.Velocity = Vector3.new(0, math.max(vel.Y * 0.82, -8), 0)
    else
        cleanFall()
    end
end)

-- ══════════════════════════════════════════════════════════
--  LOGIQUE : ESP — Highlight + Tracers + Noms
-- ══════════════════════════════════════════════════════════
local espData = {}

local function newLine()
    local l = Drawing.new("Line")
    l.Visible = false l.Thickness = 1.5 l.Transparency = 1
    return l
end
local function newText()
    local t = Drawing.new("Text")
    t.Visible = false t.Size = 14 t.Center = true
    t.Outline = true t.OutlineColor = Color3.fromRGB(0,0,0)
    t.Font = Drawing.Fonts.UI t.Transparency = 1
    return t
end

local function getED(pl)
    if not espData[pl] then
        espData[pl] = {hl=nil, tr=newLine(), nm=newText()}
    end
    return espData[pl]
end

local function removeED(pl)
    local d = espData[pl]
    if not d then return end
    pcall(function() if d.hl and d.hl.Parent then d.hl:Destroy() end end)
    pcall(function() d.tr:Remove() end)
    pcall(function() d.nm:Remove() end)
    espData[pl] = nil
end

Players.PlayerRemoving:Connect(removeED)

-- Nettoie le Highlight quand le personnage respawn
for _, pl in ipairs(Players:GetPlayers()) do
    pl.CharacterAdded:Connect(function()
        local d = espData[pl]
        if d then d.hl = nil end
    end)
end
Players.PlayerAdded:Connect(function(pl)
    pl.CharacterAdded:Connect(function()
        local d = espData[pl]
        if d then d.hl = nil end
    end)
end)

RunService.Heartbeat:Connect(function()
    local vp  = Camera.ViewportSize
    local bot = Vector2.new(vp.X / 2, vp.Y)

    for _, pl in ipairs(Players:GetPlayers()) do
        if pl == LP then continue end

        local char  = pl.Character
        local tname = nil
        pcall(function() tname = pl.Team and pl.Team.Name end)

        local col    = tname and TEAM_COL[tname]
        local active = col ~= nil and S.esp[tname] == true and char ~= nil

        if not active then
            removeED(pl)
            continue
        end

        local d    = getED(pl)
        local hrp  = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")

        -- Highlight
        if S.espHL then
            -- Recrée si absent ou si orphelin (respawn)
            if not d.hl or not d.hl.Parent or d.hl.Parent ~= char then
                pcall(function() if d.hl then d.hl:Destroy() end end)
                local h = Instance.new("Highlight")
                h.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
                h.FillTransparency    = 0.40
                h.OutlineTransparency = 0
                h.Parent              = char
                d.hl = h
            end
            d.hl.FillColor    = col
            d.hl.OutlineColor = col
        else
            if d.hl and d.hl.Parent then d.hl:Destroy() d.hl = nil end
        end

        -- Tracer + Nom
        if hrp then
            local sp, vis = Camera:WorldToViewportPoint(hrp.Position)

            if S.espTr then
                d.tr.Visible = vis
                d.tr.From    = bot
                d.tr.To      = Vector2.new(sp.X, sp.Y)
                d.tr.Color   = col
            else
                d.tr.Visible = false
            end

            if S.espNm and head then
                local hp, hv = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0))
                d.nm.Visible  = hv
                d.nm.Text     = pl.Name
                d.nm.Position = Vector2.new(hp.X, hp.Y)
                d.nm.Color    = col
            else
                d.nm.Visible = false
            end
        else
            d.tr.Visible = false
            d.nm.Visible = false
        end
    end
end)

-- ══════════════════════════════════════════════════════════
--  LOGIQUE : AIMBOT — FOV + Target + Silent Aim + Prediction
-- ══════════════════════════════════════════════════════════
local fovC = Drawing.new("Circle")
fovC.NumSides  = 64
fovC.Thickness = 1.5
fovC.Filled    = false
fovC.Visible   = false

local function getTargetPart(char)
    if S.aTarget == "Head" then
        return char:FindFirstChild("Head")
    elseif S.aTarget == "Torso" then
        return char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    else
        return char:FindFirstChild("HumanoidRootPart")
    end
end

local function getTarget()
    local vp     = Camera.ViewportSize
    local center = Vector2.new(vp.X/2, vp.Y/2)
    local best, bd = nil, S.aFov

    for _, pl in ipairs(Players:GetPlayers()) do
        if pl == LP then continue end
        local char = pl.Character
        if not char then continue end
        local part = getTargetPart(char)
        local hum  = char:FindFirstChildOfClass("Humanoid")
        if not part or not hum or hum.Health <= 0 then continue end

        local sp, os = Camera:WorldToViewportPoint(part.Position)
        if not os then continue end

        local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
        if d < bd then bd = d best = {part=part, char=char} end
    end
    return best
end

local function calcPos(t)
    local pos = t.part.Position
    if S.aPred > 0 then
        local hrp = t.char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local vel  = hrp.AssemblyLinearVelocity
            local dist = (Camera.CFrame.Position - pos).Magnitude
            pos = pos + vel * (dist / 1000) * S.aPred
        end
    end
    return pos
end

-- Silent aim : sauvegarde la cam et restore après le tir
local savedCF    = nil
local isShooting = false

UIS.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1
    or inp.UserInputType == Enum.UserInputType.Touch then
        isShooting = true
    end
end)
UIS.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1
    or inp.UserInputType == Enum.UserInputType.Touch then
        isShooting = false
        if savedCF then
            pcall(function() Camera.CFrame = savedCF end)
            savedCF = nil
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local vp = Camera.ViewportSize
    fovC.Visible  = S.aimbot or S.silentAim
    fovC.Radius   = S.aFov
    fovC.Color    = S.aColor
    fovC.Position = Vector2.new(vp.X/2, vp.Y/2)

    if not S.aimbot and not S.silentAim then return end

    local t = getTarget()
    if not t then return end

    local pos   = calcPos(t)
    local alpha = math.clamp(1 / math.max(S.aSmooth, 1), 0.01, 1)
    local goal  = CFrame.new(Camera.CFrame.Position, pos)

    if S.silentAim and isShooting then
        -- Bouge la cam au moment du tir seulement
        if not savedCF then savedCF = Camera.CFrame end
        pcall(function() Camera.CFrame = goal end)
    elseif S.aimbot then
        -- Lock continu
        pcall(function() Camera.CFrame = Camera.CFrame:Lerp(goal, alpha) end)
    end
end)
