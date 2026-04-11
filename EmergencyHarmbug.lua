-- ╔══════════════════════════════════════════════════════════╗
-- ║          GD Studio  ·  Emergency Harmbug                ║
-- ║          github.com/alexandrep388                       ║
-- ╚══════════════════════════════════════════════════════════╝

-- ─────────────────────────────────────────────────────────
--  SERVICES
-- ─────────────────────────────────────────────────────────
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")

local LP      = Players.LocalPlayer
local Camera  = workspace.CurrentCamera

-- ─────────────────────────────────────────────────────────
--  WINDUI
-- ─────────────────────────────────────────────────────────
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua", true
))()

-- ─────────────────────────────────────────────────────────
--  SON  (137402801272072)
-- ─────────────────────────────────────────────────────────
local SFX      = Instance.new("Sound")
SFX.SoundId    = "rbxassetid://137402801272072"
SFX.Volume     = 0.65
SFX.Parent     = LP:WaitForChild("PlayerGui")
local function sfx() SFX.TimePosition = 0 SFX:Play() end

-- ─────────────────────────────────────────────────────────
--  LANGUES
-- ─────────────────────────────────────────────────────────
local LANGS = {
    EN = {
        tabMain="Main", tabESP="ESP", tabAimbot="Aimbot",
        secMove="Movement", secTeams="Team ESP", secAim="Aimbot Settings",
        infSt="Infinite Stamina",  infStD="Stamina never runs out",
        aFall="Anti Fall",         aFallD="Float gently — no fall damage",
        espPolice="Police",  espPrisoner="Prisoner", espFire="Fire Dept",
        espHARS="HARS",      espTruck="Truck Co.",
        espHL="Highlight",   espHLD="Glow through walls",
        espTr="Tracers",     espTrD="Line from screen to player",
        espNm="Names",       espNmD="Show player names",
        aOn="Aimbot",        aOnD="Lock onto enemy head",
        aFov="FOV Radius",   aFovD="Detection radius on screen",
        aSmth="Smoothness",  aSmthD="Lower = faster lock",
        aPred="Prediction",  aPredD="Compensate for player movement",
        aCol="FOV Color",
        on="Enabled", off="Disabled",
        loaded="Emergency Harmbug loaded ✓",
    },
    FR = {
        tabMain="Principal", tabESP="ESP", tabAimbot="Aimbot",
        secMove="Mouvement", secTeams="ESP Équipes", secAim="Paramètres Aimbot",
        infSt="Stamina Infinie",   infStD="La stamina ne s'épuise jamais",
        aFall="Anti Chute",        aFallD="Flotte doucement — aucun dégât",
        espPolice="Police",  espPrisoner="Prisonnier", espFire="Pompiers",
        espHARS="HARS",      espTruck="Camionnage",
        espHL="Surbrillance", espHLD="Glow à travers les murs",
        espTr="Traceurs",    espTrD="Ligne vers le joueur",
        espNm="Noms",        espNmD="Affiche les noms",
        aOn="Aimbot",        aOnD="Verrouille la tête",
        aFov="Rayon FOV",    aFovD="Rayon de détection",
        aSmth="Fluidité",    aSmthD="Plus bas = plus rapide",
        aPred="Prédiction",  aPredD="Compense le mouvement",
        aCol="Couleur FOV",
        on="Activé", off="Désactivé",
        loaded="Emergency Harmbug chargé ✓",
    },
    ES = {
        tabMain="Principal", tabESP="ESP", tabAimbot="Aimbot",
        secMove="Movimiento", secTeams="ESP Equipos", secAim="Config. Aimbot",
        infSt="Stamina Infinita",  infStD="La stamina no se agota",
        aFall="Anti Caída",        aFallD="Flota suavemente — sin daño",
        espPolice="Policía", espPrisoner="Prisionero", espFire="Bomberos",
        espHARS="HARS",      espTruck="Camioneros",
        espHL="Resaltado",   espHLD="Brillo a través de paredes",
        espTr="Trazadores",  espTrD="Línea al jugador",
        espNm="Nombres",     espNmD="Muestra los nombres",
        aOn="Aimbot",        aOnD="Bloquea la cabeza",
        aFov="Radio FOV",    aFovD="Radio de detección",
        aSmth="Suavidad",    aSmthD="Más bajo = más rápido",
        aPred="Predicción",  aPredD="Compensa el movimiento",
        aCol="Color FOV",
        on="Activado", off="Desactivado",
        loaded="Emergency Harmbug cargado ✓",
    },
    PT = {
        tabMain="Principal", tabESP="ESP", tabAimbot="Aimbot",
        secMove="Movimento", secTeams="ESP Equipes", secAim="Config. Aimbot",
        infSt="Stamina Infinita",  infStD="Stamina nunca acaba",
        aFall="Anti Queda",        aFallD="Flutua suavemente — sem dano",
        espPolice="Polícia", espPrisoner="Prisioneiro", espFire="Bombeiros",
        espHARS="HARS",      espTruck="Caminhoneiros",
        espHL="Destaque",    espHLD="Brilho através das paredes",
        espTr="Tracers",     espTrD="Linha até o jogador",
        espNm="Nomes",       espNmD="Mostra os nomes",
        aOn="Aimbot",        aOnD="Mira na cabeça",
        aFov="Raio FOV",     aFovD="Raio de detecção",
        aSmth="Suavidade",   aSmthD="Mais baixo = mais rápido",
        aPred="Predição",    aPredD="Compensa o movimento",
        aCol="Cor FOV",
        on="Ativado", off="Desativado",
        loaded="Emergency Harmbug carregado ✓",
    },
    DE = {
        tabMain="Haupt", tabESP="ESP", tabAimbot="Aimbot",
        secMove="Bewegung", secTeams="Team-ESP", secAim="Aimbot-Einstellungen",
        infSt="Unendl. Stamina",   infStD="Stamina wird nie aufgebraucht",
        aFall="Anti-Fall",         aFallD="Gleitet sanft — kein Schaden",
        espPolice="Polizei", espPrisoner="Gefangener", espFire="Feuerwehr",
        espHARS="HARS",      espTruck="LKW-Firma",
        espHL="Hervorhebung", espHLD="Glühen durch Wände",
        espTr="Tracer",      espTrD="Linie zum Spieler",
        espNm="Namen",       espNmD="Spielernamen anzeigen",
        aOn="Aimbot",        aOnD="Zielt auf den Kopf",
        aFov="FOV-Radius",   aFovD="Erkennungsradius",
        aSmth="Glättung",    aSmthD="Niedriger = schneller",
        aPred="Vorhersage",  aPredD="Kompensiert Bewegung",
        aCol="FOV-Farbe",
        on="Aktiviert", off="Deaktiviert",
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

-- ─────────────────────────────────────────────────────────
--  STATE
-- ─────────────────────────────────────────────────────────
local S = {
    infStamina=false, antiFall=false,
    aimbot=false, aFov=150, aSmooth=5, aPred=0,
    aColor=Color3.fromRGB(255,60,60),
    espHL=true, espTr=false, espNm=false,
    esp={Police=false,Prisoner=false,FireDepartment=false,HARS=false,TruckCompany=false},
}

local TEAM_COL = {
    Police         = Color3.fromRGB(30, 110, 255),
    Prisoner       = Color3.fromRGB(255,140,  0),
    FireDepartment = Color3.fromRGB(220, 30,  30),
    HARS           = Color3.fromRGB(230,230,  80),
    TruckCompany   = Color3.fromRGB(215,215, 215),
}

-- ─────────────────────────────────────────────────────────
--  THÈME + GRADIENT
-- ─────────────────────────────────────────────────────────
WindUI:AddTheme({
    Name        = "GDEmerald",
    Accent      = Color3.fromRGB(52,  211, 153),
    Background  = Color3.fromRGB(10,   14,  20),
    Outline     = Color3.fromRGB(28,   42,  52),
    Text        = Color3.fromRGB(220, 240, 230),
    Placeholder = Color3.fromRGB(80,  110, 100),
    Button      = Color3.fromRGB(18,   28,  38),
    Icon        = Color3.fromRGB(52,  211, 153),
})
WindUI:SetTheme("GDEmerald")

-- ─────────────────────────────────────────────────────────
--  FENÊTRE
-- ─────────────────────────────────────────────────────────
local Window = WindUI:CreateWindow({
    Title       = "GD Studio",
    Icon        = "shield-check",
    Author      = "Emergency Harmbug",
    Folder      = FOLDER,
    Size        = UDim2.fromOffset(620, 480),
    Transparent = true,
    Resizable   = false,
})

WindUI:Gradient({
    ["0"]   = {Color=Color3.fromRGB(10,28,22), Transparency=0},
    ["50"]  = {Color=Color3.fromRGB(10,14,20), Transparency=0},
    ["100"] = {Color=Color3.fromRGB(8, 18,32), Transparency=0},
},{Rotation=135})

Window:Tag({Title="Emergency Harmbug", Color=Color3.fromRGB(52,211,153), Radius=20})
Window:Tag({Title=LANG_FLAG[currentLang].." "..currentLang, Color=Color3.fromRGB(70,130,220), Radius=20})

-- ─────────────────────────────────────────────────────────
--  NOTIFY
-- ─────────────────────────────────────────────────────────
local function Notify(txt, icon)
    sfx()
    task.spawn(function()
        WindUI:Notify({Title="GD Studio",Content=txt,Icon=icon or "bell",Duration=3,CanClose=true})
    end)
end

-- ─────────────────────────────────────────────────────────
--  CYCLE LANGUE (appelé au clic du tag)
-- ─────────────────────────────────────────────────────────
local function cycleLang()
    sfx()
    local idx = 1
    for i,c in ipairs(LANG_ORDER) do if c==currentLang then idx=i break end end
    currentLang = LANG_ORDER[(idx%#LANG_ORDER)+1]
    L = LANGS[currentLang]
    pcall(function() writefile(FOLDER.."/language.txt", currentLang) end)
    -- Mise à jour visuelle du tag dans le GUI
    pcall(function()
        for _,obj in ipairs(LP.PlayerGui:GetDescendants()) do
            if obj:IsA("TextLabel") and #obj.Text<=6 then
                for _,f in ipairs({"🇬🇧","🇫🇷","🇪🇸","🇧🇷","🇩🇪"}) do
                    if obj.Text:find(f) then
                        obj.Text = LANG_FLAG[currentLang].." "..currentLang
                        break
                    end
                end
            end
        end
    end)
    Notify(LANG_FLAG[currentLang].." "..currentLang.." — reload for full translation", "globe")
end

-- ══════════════════════════════════════════════════════════
--  TAB : MAIN
-- ══════════════════════════════════════════════════════════
local MainTab = Window:Tab({Title=L.tabMain, Icon="layout-dashboard"})

MainTab:Section({Title=L.secMove, Icon="zap"})

MainTab:Toggle({
    Title=L.infSt, Desc=L.infStD, Icon="battery-charging", Type="Checkbox", Value=false,
    Callback=function(v) S.infStamina=v sfx() Notify(L.infSt.." — "..(v and L.on or L.off),"battery-charging") end
})
MainTab:Toggle({
    Title=L.aFall, Desc=L.aFallD, Icon="feather", Type="Checkbox", Value=false,
    Callback=function(v) S.antiFall=v sfx() Notify(L.aFall.." — "..(v and L.on or L.off),"feather") end
})

-- ══════════════════════════════════════════════════════════
--  TAB : ESP
-- ══════════════════════════════════════════════════════════
local ESPTab = Window:Tab({Title=L.tabESP, Icon="eye"})

ESPTab:Section({Title=L.secTeams, Icon="users"})

local espTeams = {
    {key="Police",         label=L.espPolice,   icon="shield"},
    {key="Prisoner",       label=L.espPrisoner, icon="lock"},
    {key="FireDepartment", label=L.espFire,     icon="flame"},
    {key="HARS",           label=L.espHARS,     icon="heart-pulse"},
    {key="TruckCompany",   label=L.espTruck,    icon="truck"},
}
for _,e in ipairs(espTeams) do
    ESPTab:Toggle({Title=e.label,Icon=e.icon,Type="Checkbox",Value=false,
        Callback=function(v) S.esp[e.key]=v sfx() end})
end

ESPTab:Divider({Title="Visual"})

ESPTab:Toggle({Title=L.espHL, Desc=L.espHLD, Icon="layers",         Type="Checkbox",Value=true,  Callback=function(v) S.espHL=v sfx() end})
ESPTab:Toggle({Title=L.espTr, Desc=L.espTrD, Icon="arrow-up-right", Type="Checkbox",Value=false, Callback=function(v) S.espTr=v sfx() end})
ESPTab:Toggle({Title=L.espNm, Desc=L.espNmD, Icon="tag",            Type="Checkbox",Value=false, Callback=function(v) S.espNm=v sfx() end})

-- ══════════════════════════════════════════════════════════
--  TAB : AIMBOT
-- ══════════════════════════════════════════════════════════
local AimTab = Window:Tab({Title=L.tabAimbot, Icon="crosshair"})

AimTab:Section({Title=L.secAim, Icon="target"})

AimTab:Toggle({
    Title=L.aOn, Desc=L.aOnD, Icon="target", Type="Checkbox", Value=false,
    Callback=function(v) S.aimbot=v sfx() Notify(L.aOn.." — "..(v and L.on or L.off),"crosshair") end
})
AimTab:Slider({Title=L.aFov,  Desc=L.aFovD,  Icon="circle",              Value={Min=30, Max=700,Default=150},Step=5,  Callback=function(v) S.aFov=v end})
AimTab:Slider({Title=L.aSmth, Desc=L.aSmthD, Icon="sliders-horizontal",  Value={Min=1,  Max=30, Default=5},  Step=1,  Callback=function(v) S.aSmooth=v end})
AimTab:Slider({Title=L.aPred, Desc=L.aPredD, Icon="zap",                 Value={Min=0,  Max=30, Default=0},  Step=1,  Callback=function(v) S.aPred=v end})
AimTab:Colorpicker({Title=L.aCol, Icon="palette", Value=Color3.fromRGB(255,60,60), Callback=function(v) S.aColor=v end})

-- ══════════════════════════════════════════════════════════
--  INIT
-- ══════════════════════════════════════════════════════════
Window:Init()

task.spawn(function()
    task.wait(0.7)
    Notify(L.loaded, "check-circle")
end)

-- ── Rend le tag cliquable (cycle langue) ─────────────────
task.spawn(function()
    task.wait(1.8)
    pcall(function()
        for _,obj in ipairs(LP.PlayerGui:GetDescendants()) do
            if obj:IsA("TextLabel") and #obj.Text<=6 then
                for _,f in ipairs({"🇬🇧","🇫🇷","🇪🇸","🇧🇷","🇩🇪"}) do
                    if obj.Text:find(f) then
                        local btn = Instance.new("TextButton")
                        btn.Size = UDim2.new(1,0,1,0)
                        btn.BackgroundTransparency = 1
                        btn.Text = ""
                        btn.ZIndex = obj.ZIndex + 10
                        btn.Parent = obj
                        btn.MouseButton1Click:Connect(cycleLang)
                        break
                    end
                end
            end
        end
    end)
end)

-- ══════════════════════════════════════════════════════════
--  INFINITE STAMINA
-- ══════════════════════════════════════════════════════════
task.spawn(function()
    task.wait(4)
    local stObj = nil
    -- Cherche l'instance live du controller via getgc
    pcall(function()
        for _,v in ipairs(getgc(true)) do
            if type(v)=="table"
            and type(rawget(v,"stamina"))=="number"
            and rawget(v,"hasStaminaBoost")~=nil then
                stObj = v break
            end
        end
    end)

    if stObj then
        -- Hook setStamina
        local origSet = rawget(stObj,"setStamina") or stObj.setStamina
        if type(origSet)=="function" then
            stObj.setStamina = function(self,val)
                if S.infStamina then return origSet(self,1) end
                return origSet(self,val)
            end
        end
        -- Hook useStamina
        local origUse = rawget(stObj,"useStamina") or stObj.useStamina
        if type(origUse)=="function" then
            stObj.useStamina = function(self,amount)
                if S.infStamina then return true end
                return origUse(self,amount)
            end
        end
        -- Force la valeur à 1 en continu
        RunService.Heartbeat:Connect(function()
            if S.infStamina then pcall(function() rawset(stObj,"stamina",1) end) end
        end)
    else
        -- Fallback attribut Humanoid
        RunService.Heartbeat:Connect(function()
            if not S.infStamina then return end
            local char = LP.Character
            if not char then return end
            pcall(function()
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum then return end
                for _,a in ipairs({"Stamina","stamina","STAMINA"}) do
                    if hum:GetAttribute(a)~=nil then hum:SetAttribute(a,1) end
                end
            end)
        end)
    end
end)

-- ══════════════════════════════════════════════════════════
--  ANTI FALL  —  BodyVelocity
-- ══════════════════════════════════════════════════════════
local bvFall = nil
local function cleanBV()
    if bvFall and bvFall.Parent then bvFall:Destroy() end
    bvFall = nil
end
LP.CharacterRemoving:Connect(cleanBV)

RunService.Heartbeat:Connect(function()
    if not S.antiFall then cleanBV() return end
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    local st = hum:GetState()
    local falling = st==Enum.HumanoidStateType.Freefall or st==Enum.HumanoidStateType.FallingDown

    if falling then
        local vel = hrp.AssemblyLinearVelocity
        if vel.Y < -22 then
            if not bvFall or not bvFall.Parent then
                bvFall          = Instance.new("BodyVelocity")
                bvFall.MaxForce = Vector3.new(0, math.huge, 0)
                bvFall.P        = 1e5
                bvFall.Parent   = hrp
            end
            bvFall.Velocity = Vector3.new(0, math.max(vel.Y*0.80, -8), 0)
        else
            cleanBV()
        end
    else
        cleanBV()
    end
end)

-- ══════════════════════════════════════════════════════════
--  ESP  —  Highlight + Tracers + Noms
-- ══════════════════════════════════════════════════════════
local espData = {}

local function newLine()
    local l=Drawing.new("Line") l.Visible=false l.Thickness=1.2 l.Transparency=1 return l
end
local function newText()
    local t=Drawing.new("Text") t.Visible=false t.Size=14 t.Center=true
    t.Outline=true t.OutlineColor=Color3.fromRGB(0,0,0) t.Font=Drawing.Fonts.UI t.Transparency=1 return t
end

local function getED(player)
    if not espData[player] then
        espData[player]={hl=nil,tr=newLine(),nm=newText()}
    end
    return espData[player]
end

local function removeED(player)
    if not espData[player] then return end
    local d=espData[player]
    pcall(function() if d.hl and d.hl.Parent then d.hl:Destroy() end end)
    pcall(function() d.tr:Remove() end)
    pcall(function() d.nm:Remove() end)
    espData[player]=nil
end
Players.PlayerRemoving:Connect(removeED)

RunService.Heartbeat:Connect(function()
    local vp=Camera.ViewportSize
    local bot=Vector2.new(vp.X/2, vp.Y)

    for _,pl in ipairs(Players:GetPlayers()) do
        if pl==LP then continue end
        local char=pl.Character
        local team=pl.Team
        local tn=team and team.Name
        local col=TEAM_COL[tn]
        local active=col~=nil and S.esp[tn]==true and char~=nil

        if not active then removeED(pl) continue end

        local d=getED(pl)
        local hrp=char:FindFirstChild("HumanoidRootPart")
        local head=char:FindFirstChild("Head")

        -- Highlight
        if S.espHL then
            if not d.hl or not d.hl.Parent then
                local h=Instance.new("Highlight")
                h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                h.FillTransparency=0.50
                h.OutlineTransparency=0
                h.Parent=char
                d.hl=h
            end
            d.hl.FillColor=col
            d.hl.OutlineColor=col
        elseif d.hl and d.hl.Parent then
            d.hl:Destroy() d.hl=nil
        end

        -- Tracer + Nom
        if hrp and (S.espTr or S.espNm) then
            local sp,vis=Camera:WorldToViewportPoint(hrp.Position)
            if S.espTr then
                d.tr.Visible=vis
                d.tr.From=bot
                d.tr.To=Vector2.new(sp.X,sp.Y)
                d.tr.Color=col
            else d.tr.Visible=false end

            if S.espNm and head then
                local hp,hv=Camera:WorldToViewportPoint(head.Position+Vector3.new(0,1.5,0))
                d.nm.Visible=hv
                d.nm.Text=pl.Name
                d.nm.Position=Vector2.new(hp.X,hp.Y)
                d.nm.Color=col
            else d.nm.Visible=false end
        else
            d.tr.Visible=false d.nm.Visible=false
        end
    end
end)

-- ══════════════════════════════════════════════════════════
--  AIMBOT  —  FOV + prédiction + lock tête
-- ══════════════════════════════════════════════════════════
local fovC=Drawing.new("Circle")
fovC.NumSides=64 fovC.Thickness=1.5 fovC.Filled=false fovC.Visible=false

local function getTarget()
    local vp=Camera.ViewportSize
    local center=Vector2.new(vp.X/2,vp.Y/2)
    local best,bd=nil,S.aFov
    for _,pl in ipairs(Players:GetPlayers()) do
        if pl==LP then continue end
        local char=pl.Character if not char then continue end
        local head=char:FindFirstChild("Head")
        local hum=char:FindFirstChildOfClass("Humanoid")
        if not head or not hum or hum.Health<=0 then continue end
        local sp,os=Camera:WorldToViewportPoint(head.Position)
        if not os then continue end
        local d=(Vector2.new(sp.X,sp.Y)-center).Magnitude
        if d<bd then bd=d best={head=head,char=char} end
    end
    return best
end

RunService.RenderStepped:Connect(function()
    local vp=Camera.ViewportSize
    fovC.Visible=S.aimbot
    fovC.Radius=S.aFov
    fovC.Color=S.aColor
    fovC.Position=Vector2.new(vp.X/2,vp.Y/2)

    if not S.aimbot then return end
    local t=getTarget() if not t then return end

    local pos=t.head.Position
    if S.aPred>0 then
        local hrp=t.char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local vel=hrp.AssemblyLinearVelocity
            local dist=(Camera.CFrame.Position-pos).Magnitude
            pos=pos+vel*(dist/1000)*S.aPred
        end
    end

    local alpha=math.clamp(1/math.max(S.aSmooth,1),0.01,1)
    Camera.CFrame=Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position,pos),alpha)
end)
