-- check if game is loaded
while not game:IsLoaded() do task.wait(0.1) end

local UI_URL      = 'https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/Source.lua'
local THEME_URL   = 'https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/addons/ThemeManager.lua'
local SAVE_URL    = 'https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/addons/SaveManager.lua'

local bc = loadstring(game:HttpGet(UI_URL))()
local ci = loadstring(game:HttpGet(THEME_URL))()
local bx = loadstring(game:HttpGet(SAVE_URL))()

-- create window
local dc = bc:CreateWindow({
    Title = 'creep.cc example',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2,
})

-- create tabs
local ch = {
    Combat      = dc:AddTab('Combat'),
    Triggerbot  = dc:AddTab('Triggerbot'),
    Visuals     = dc:AddTab('Visuals'),
    Performance = dc:AddTab('Performance'),
    Skin        = dc:AddTab('Skin'),
    Misc        = dc:AddTab('Misc'),
    ['Ui']      = dc:AddTab('Ui'),
}

-- COMBAT
local q = ch.Combat:AddLeftGroupbox('Silent Aim')
local o = ch.Combat:AddRightGroupbox('Aimbot')
local p = ch.Combat:AddRightGroupbox('FOV Settings')

q:AddToggle('SilentAimEnabled',   { Text = 'Silent Aim',     Default = false })
q:AddToggle('SilentAimFOV',       { Text = 'FOV Silent Aim', Default = false })
q:AddToggle('SilentAimWallcheck', { Text = 'Wallcheck',      Default = false })
q:AddToggle('SilentAimTeamCheck', { Text = 'Team Check',     Default = false })
q:AddDropdown('SilentAimBone', {
    Text = 'Target Bone', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
})
q:AddSlider('SilentAimMaxDistance', { Text = 'Max Distance', Default = 300, Min = 50, Max = 1000, Rounding = 0, Suffix = ' studs' })
q:AddSlider('SilentAimPrediction',  { Text = 'Prediction',   Default = 8,   Min = 1,  Max = 30,   Rounding = 0 })
q:AddToggle('HitNotify',            { Text = 'Hit Notify',    Default = false })

o:AddToggle('AimbotEnabled', { Text = 'Enabled', Default = false })
    :AddKeyPicker('AimbotKey', { Default = 'None', Mode = 'Hold', Text = 'Aimbot', NoUI = false })
o:AddToggle('AimbotWallcheck',  { Text = 'Wallcheck',  Default = false })
o:AddToggle('AimbotPrediction', { Text = 'Prediction', Default = false })
o:AddToggle('AimbotSticky',     { Text = 'Sticky Aim', Default = false })
o:AddToggle('AimbotTeamCheck',  { Text = 'Team Check', Default = false })
o:AddDropdown('AimbotBone', {
    Text = 'Target Bone', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
})
o:AddSlider('AimbotFOV',          { Text = 'FOV',              Default = 120, Min = 30,  Max = 500,  Rounding = 0, Suffix = ' px' })
o:AddSlider('AimbotSmoothing',    { Text = 'Smoothing',        Default = 15,  Min = 1,   Max = 100,  Rounding = 0 })
o:AddSlider('AimbotSensitivity',  { Text = 'Sensitivity',      Default = 1,   Min = 0.1, Max = 2,    Rounding = 1 })
o:AddSlider('AimbotMaxDistance',  { Text = 'Max Distance',     Default = 300, Min = 50,  Max = 1000, Rounding = 0, Suffix = ' studs' })
o:AddSlider('AimbotPredictScale', { Text = 'Predict Strength', Default = 8,   Min = 1,   Max = 30,   Rounding = 0 })

p:AddToggle('FOVEnabled',     { Text = 'Show FOV Circle', Default = false })
p:AddToggle('FOVFilled',      { Text = 'FOV Filled',      Default = false })
p:AddSlider('FOVThickness',   { Text = 'FOV Thickness',   Default = 2,  Min = 1,   Max = 10,  Rounding = 0 })
p:AddSlider('FOVTransparency',{ Text = 'FOV Transp',      Default = 85, Min = 0,   Max = 100, Rounding = 0 })
p:AddSlider('FOVFillTransp',  { Text = 'FOV Fill Transp', Default = 85, Min = 0,   Max = 100, Rounding = 0 })
p:AddSlider('FOVSpinSpeed',   { Text = 'FOV Spin Speed',  Default = 1,  Min = 0.1, Max = 10,  Rounding = 1 })
p:AddLabel('FOV Outline Color 1'):AddColorPicker('FOVColor',        { Default = Color3.new(1,1,1) })
p:AddLabel('FOV Outline Color 2'):AddColorPicker('FOVColor2',       { Default = Color3.fromRGB(0,200,255) })
p:AddLabel('FOV Outline Color 3'):AddColorPicker('FOVColor3',       { Default = Color3.fromRGB(255,0,255) })
p:AddLabel('FOV Fill Color 1'):AddColorPicker('FOVFillColor',       { Default = Color3.fromRGB(0,200,255) })
p:AddLabel('FOV Fill Color 2'):AddColorPicker('FOVFillColor2',      { Default = Color3.fromRGB(0,90,255) })
p:AddLabel('FOV Fill Color 3'):AddColorPicker('FOVFillColor3',      { Default = Color3.fromRGB(255,100,0) })

-- TRIGGERBOT
local ck = ch.Triggerbot:AddLeftGroupbox('Triggerbot')
local cj = ch.Triggerbot:AddRightGroupbox('Settings')

ck:AddToggle('TriggerbotEnabled', { Text = 'Enabled', Default = false })
    :AddKeyPicker('TriggerbotKey', { Default = 'None', Mode = 'Hold', Text = 'Triggerbot', NoUI = false })
ck:AddToggle('TriggerbotFOVEnabled', { Text = 'FOV',         Default = false })
ck:AddToggle('TriggerbotScopeCheck', { Text = 'Scope Check', Default = false })
ck:AddToggle('KatanaCheck',          { Text = 'Anti Katana', Default = false })
ck:AddDropdown('TriggerbotBone', {
    Text = 'Hitbox', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
})

cj:AddSlider('TriggerbotRadius',          { Text = 'Radius',         Default = 25,  Min = 1,   Max = 100, Rounding = 0, Suffix = ' px' })
cj:AddSlider('TriggerbotMinDelay',        { Text = 'Min Delay',      Default = 50,  Min = 0,   Max = 500, Rounding = 0, Suffix = ' ms' })
cj:AddSlider('TriggerbotMaxDelay',        { Text = 'Max Delay',      Default = 120, Min = 0,   Max = 500, Rounding = 0, Suffix = ' ms' })
cj:AddSlider('TriggerbotClickHold',       { Text = 'Base Delay',     Default = 30,  Min = 10,  Max = 150, Rounding = 0, Suffix = ' ms' })
cj:AddLabel('FOV Outline 1'):AddColorPicker('TriggerbotFOVColor',  { Default = Color3.new(1,0,0) })
cj:AddLabel('FOV Outline 2'):AddColorPicker('TriggerbotFOVColor2', { Default = Color3.fromRGB(255,120,120) })
cj:AddSlider('TriggerbotFOVThickness',    { Text = 'FOV Thickness',  Default = 2,  Min = 1, Max = 10,  Rounding = 0 })
cj:AddSlider('TriggerbotFOVTransparency', { Text = 'FOV Transp',     Default = 50, Min = 0, Max = 100, Rounding = 0 })
cj:AddToggle('TriggerbotFOVFilled',       { Text = 'FOV Filled',     Default = false })
cj:AddLabel('FOV Fill 1'):AddColorPicker('TriggerbotFOVFillColor',  { Default = Color3.fromRGB(255,0,0) })
cj:AddLabel('FOV Fill 2'):AddColorPicker('TriggerbotFOVFillColor2', { Default = Color3.fromRGB(120,0,0) })
cj:AddSlider('TriggerbotFOVFillTransp',   { Text = 'FOV Fill Transp',Default = 60, Min = 0, Max = 100, Rounding = 0 })
cj:AddSlider('TriggerbotFOVSpinSpeed',    { Text = 'FOV Spin Speed', Default = 1,  Min = 0.1, Max = 10, Rounding = 1 })

-- VISUALS
local ag = ch.Visuals:AddLeftGroupbox('ESP')
local ah = ch.Visuals:AddRightGroupbox('Settings')
ag:AddToggle('ESPEnabled',      { Text = 'ESP Enabled',     Default = false })
ag:AddToggle('ESPBox',          { Text = 'Box',             Default = false })
ag:AddToggle('ESPCornerBox',    { Text = 'Corner Box',      Default = false })
ag:AddToggle('ESPFilled',       { Text = 'Filled Box',      Default = false })
ag:AddToggle('ESPDistance',     { Text = 'Distance',        Default = false })
ag:AddToggle('ESPSkeleton',     { Text = 'Skeleton',        Default = false })
ag:AddToggle('ShowFriendlyESP', { Text = 'Show Friendlies', Default = false })
ag:AddDropdown('ESPAnimMode', {
    Text = 'Animation Mode', Default = 'Spinning Gradient',
    Values = { 'Static','Rainbow','Spinning Gradient','Pulse' },
})
ag:AddSlider('ESPAnimSpeed', { Text = 'Animation Speed', Default = 1, Min = 0.1, Max = 10, Rounding = 1 })

ah:AddSlider('ESPMaxDistance',       { Text = 'Max Distance',   Default = 300, Min = 50, Max = 1000, Rounding = 0, Suffix = ' studs' })
ah:AddSlider('ESPBoxThickness',      { Text = 'Box Thickness',  Default = 1,   Min = 1,  Max = 5,    Rounding = 0 })
ah:AddSlider('ESPSkeletonThickness', { Text = 'Skeleton Thick', Default = 1,   Min = 1,  Max = 5,    Rounding = 0 })
ah:AddSlider('ESPFillTransp',        { Text = 'Fill Transp',    Default = 70,  Min = 0,  Max = 100,  Rounding = 0 })
ah:AddLabel('Visible Color'):AddColorPicker('ESPVisibleColor',      { Default = Color3.new(0,1,0) })
ah:AddLabel('Hidden Color'):AddColorPicker('ESPInvisibleColor',     { Default = Color3.new(1,0,0) })
ah:AddLabel('Distance Color'):AddColorPicker('ESPDistanceColor',    { Default = Color3.new(1,1,1) })
ah:AddLabel('Gradient Color 2'):AddColorPicker('ESPGradientColor2', { Default = Color3.fromRGB(0,200,255) })

local cz = ch.Visuals:AddRightGroupbox('Weapon Chams')
cz:AddToggle('WeaponChamsEnabled', { Text = 'Enabled', Default = false })
cz:AddDropdown('WeaponChamsMaterial', {
    Text = 'Material', Default = 'ForceField',
    Values = { 'ForceField','Neon','Glass','SmoothPlastic','Metal','Wood','Marble','Granite','Brick','Cobblestone' },
})
cz:AddSlider('WeaponChamsTransparency', { Text = 'Transparency', Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = '%' })
cz:AddLabel('Color'):AddColorPicker('WeaponChamsColor', { Default = Color3.new(1,1,1) })

local ax = ch.Visuals:AddLeftGroupbox('Bullet Tracers')
ax:AddToggle('HitTracersEnabled', { Text = 'Enabled', Default = false })
ax:AddLabel('Color'):AddColorPicker('HitTracerColor', { Default = Color3.fromRGB(0,255,255) })
ax:AddSlider('HitTracerThickness', { Text = 'Thickness', Default = 8,  Min = 1,  Max = 50,  Rounding = 0 })
ax:AddSlider('HitTracerLifetime',  { Text = 'Lifetime',  Default = 75, Min = 10, Max = 500, Rounding = 0, Suffix = ' ms' })
ax:AddSlider('HitTracerFadeIn',    { Text = 'Fade In',   Default = 5,  Min = 0,  Max = 200, Rounding = 0, Suffix = ' ms' })
ax:AddSlider('HitTracerFadeOut',   { Text = 'Fade Out',  Default = 35, Min = 0,  Max = 300, Rounding = 0, Suffix = ' ms' })

local ct = ch.Visuals:AddLeftGroupbox('Utility ESP')
ct:AddToggle('UtilityESPEnabled', { Text = 'Enabled', Default = false })
ct:AddToggle('UtilityESPName',    { Text = 'Name',    Default = true })
ct:AddToggle('UtilityESPGlow',    { Text = 'Glow',    Default = true })
ct:AddLabel('Color'):AddColorPicker('UtilityESPColor', { Default = Color3.fromRGB(0,255,120) })

local be = ch.Visuals:AddLeftGroupbox('Lighting Changer')
be:AddToggle('LightingChangerEnabled', { Text = 'Enabled',    Default = false })
be:AddSlider('LightingBrightness',     { Text = 'Brightness', Default = 2,  Min = 0,  Max = 10, Rounding = 1 })
be:AddSlider('LightingClockTime',      { Text = 'Time',       Default = 14, Min = 0,  Max = 24, Rounding = 1 })
be:AddSlider('LightingExposure',       { Text = 'Exposure',   Default = 0,  Min = -5, Max = 5,  Rounding = 1 })
be:AddLabel('Ambient'):AddColorPicker('LightingAmbient',                 { Default = Color3.fromRGB(128,128,128) })
be:AddLabel('Outdoor Ambient'):AddColorPicker('LightingOutdoorAmbient',  { Default = Color3.fromRGB(128,128,128) })
be:AddLabel('Color Shift Top'):AddColorPicker('LightingColorShiftTop',   { Default = Color3.new(0,0,0) })
be:AddLabel('Color Shift Bottom'):AddColorPicker('LightingColorShiftBottom', { Default = Color3.new(0,0,0) })

local ca = ch.Visuals:AddRightGroupbox('Skybox Changer')
ca:AddDropdown('SkyboxSelection', {
    Text = 'Skybox', Default = 1,
    Values = { "Minecraft","Dreaming","Space","Cartoony","Night","Pink","Red","Purple","Milkyway","Galaxy","Anime" },
})

-- performance tab
local bn = ch.Performance:AddLeftGroupbox('Performance')
bn:AddSlider('RaycastUpdateRate', {
    Text = 'Raycast Delay', Default = 50, Min = 0, Max = 500, Rounding = 0,
    Suffix = ' ms', Tooltip = '(higher = better FPS, lower = more accurate)',
})

local by = ch.Skin:AddLeftGroupbox('Skin Changer')
by:AddToggle('UseUnlockAll', { Text = 'Use Unlock All', Default = false })
by:AddDropdown('SkinCategory', {
    Text = 'Category', Default = 1,
    Values = { 'assault_rifle','sniper_rifle','shotgun','pistol','launcher','heavy','grenades','utility','melee' },
})
by:AddDropdown('SkinWeapon', { Text = 'Weapon', Default = 1, Values = { 'ak47' } })
by:AddDropdown('SkinName',   { Text = 'Skin',   Default = 1, Values = { '' } })
by:AddButton('Apply Skin', function() end)

local bk = ch.Misc:AddLeftGroupbox('Hitsounds')
local soundList = { 'Normal','Neverlose','Gamesense','Fatality','Splash','Thonk','Cowbell','Slap','Tung','Hit','Ding','Chicken','Moan','Girl','Cat Girl','Tiki Tiki','Jew','Fart','Bubble','Tf2','Cs2','Mambo','Toma','Kirk','Plastic','Lego','67' }
bk:AddDropdown('HitSoundHead',     { Text = 'Head',        Default = 'Normal', Values = soundList })
bk:AddSlider('HitSoundHeadVolume', { Text = 'Head Volume', Default = 1, Min = 0, Max = 10, Rounding = 1 })
bk:AddDropdown('HitSoundBody',     { Text = 'Body',        Default = 'Normal', Values = soundList })
bk:AddSlider('HitSoundBodyVolume', { Text = 'Body Volume', Default = 1, Min = 0, Max = 10, Rounding = 1 })
bk:AddDropdown('HitSoundKill',     { Text = 'Kill',        Default = 'Normal', Values = soundList })
bk:AddSlider('HitSoundKillVolume', { Text = 'Kill Volume', Default = 1, Min = 0, Max = 10, Rounding = 1 })

local ay_group = ch.Misc:AddLeftGroupbox('Dummy Settings')
ay_group:AddToggle('AllowDummys', { Text = 'Allow Dummys', Default = false })

-- UI TAB
local bj = ch['Ui']:AddLeftGroupbox('Menu')
bj:AddButton('Unload', function() bc:Unload() end)
bj:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'RightShift',
    NoUI = true,
    Text = 'Menu keybind',
    ChangedCallback = function()
        bc.ToggleKeybind = Options.MenuKeybind
    end,
})
bj:AddToggle('ShowKeybinds', {
    Text = 'Show Keybinds',
    Default = false,
    Callback = function(v)
        if bc.KeybindFrame then
            bc.KeybindFrame.Visible = v
        end
        -- EliteZone also has this flag:
        bc.KeypickerListVisible = v
    end,
})
bj:AddToggle('ShowWatermark', {
    Text = 'Show Watermark',
    Default = true,
    Callback = function(v)
        if bc.SetWatermarkVisibility then
            bc:SetWatermarkVisibility(v)
        end
    end,
})
bj:AddToggle('ShowToggleInKeybinds', {
    Text = 'Toggle Box in Keybinds',
    Default = true,
    Callback = function(v)
        bc.ShowToggleFrameInKeybinds = v
        if bc.UpdateKeybindFrame then bc:UpdateKeybindFrame() end
    end,
})

-- Background / keybind transparency
local bg = ch['Ui']:AddLeftGroupbox('Background')
bg:AddSlider('KeybindTransparency', {
    Text     = 'Keybind Transparency',
    Default  = 0,
    Min      = 0,
    Max      = 100,
    Rounding = 0,
    Suffix   = '%',
    Callback = function(Value)
        local Alpha = Value / 100
        bc.KeybindMenuTransparency = 1 - Alpha  -- EliteZone uses inverse scale in UpdateKeybindMenu
        if bc.UpdateKeybindMenu then
            bc:UpdateKeybindMenu()
        else
            local Outer = bc.KeybindFrame
            if Outer then
                Outer.BackgroundTransparency = Alpha
                Outer.BorderSizePixel = Alpha >= 1 and 0 or 1
            end
            local Inner = bc.KeybindInner or (Outer and Outer:FindFirstChildOfClass('Frame'))
            if Inner then
                Inner.BackgroundTransparency = Alpha
                Inner.BorderSizePixel = Alpha >= 1 and 0 or 1
            end
        end
    end,
})

-- Notifications
local ng = ch['Ui']:AddLeftGroupbox('Notifications')
ng:AddDropdown('NotificationBarSide', {
    Text = 'Accent Bar Position',
    Default = (bc.NotificationStyle and bc.NotificationStyle.BarSide) or 'Bottom',
    Values = { 'Top', 'Bottom', 'Left', 'Right' },
    Callback = function(Value)
        if bc.NotificationStyle then
            bc.NotificationStyle.BarSide = Value
        end
    end,
})
ng:AddSlider('NotificationTransparency', {
    Text = 'Transparency',
    Default = math.floor(((bc.NotificationStyle and bc.NotificationStyle.Transparency) or 0.75) * 100),
    Min = 0, Max = 100, Rounding = 0, Suffix = '%',
    Callback = function(Value)
        if bc.NotificationStyle then
            bc.NotificationStyle.Transparency = Value / 100
        end
    end,
})
ng:AddButton('Test Notification', function()
    if bc.Notify then bc:Notify('Test Notification') end
end)

-- ===================== SAVE / THEME =====================
ci:SetLibrary(bc)
bx:SetLibrary(bc)
bx:IgnoreThemeSettings()
bx:SetIgnoreIndexes({})

-- Create folders safely before Apply
ci:SetFolder('logic')
bx:SetFolder('logic')
pcall(function() ci:BuildFolderTree() end)
pcall(function() bx:BuildFolderTree() end)

bx:BuildConfigSection(ch['Ui'])
ci:ApplyToTab(ch['Ui'])
pcall(function() ci:ApplyTheme('Default') end)  -- 'Logic' may not exist; use Default or a real theme name

-- your game logic
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local InputService = game:GetService('UserInputService')
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function Bool(T, Name)
    if T and T[Name] then return T[Name].Value == true end
    return false
end
local function Slider(T, Name, Default)
    if T and T[Name] and type(T[Name].Value) == 'number' then return T[Name].Value end
    return Default
end
local function EnabledBones(T, Name)
    if T and T[Name] and type(T[Name].Value) == 'table' then
        local bones = {}
        for k, v in pairs(T[Name].Value) do
            if v then table.insert(bones, k) end
        end
        if #bones > 0 then return bones end
    end
    return { 'Head' }
end

local function GetOptions()
    local SilentAim = Bool(Toggles, 'SilentAimEnabled')
    local SilentAimFOV = Bool(Toggles, 'SilentAimFOV')
    return {
        SilentAim = SilentAim,
        SilentAimFOV = SilentAimFOV,
        SilentAimActive = SilentAim or SilentAimFOV,
        HitNotify = Bool(Toggles, 'HitNotify'),
        FOVEnabled = Bool(Toggles, 'FOVEnabled'),
        WallCheck = Bool(Toggles, 'SilentAimWallcheck') or Bool(Toggles, 'AimbotWallcheck'),
        TeamCheck = Bool(Toggles, 'SilentAimTeamCheck') or Bool(Toggles, 'AimbotTeamCheck') or Bool(Toggles, 'TeamCheck'),
        FOVRadius = Slider(Options, 'AimbotFOV', 120),
        Prediction = Slider(Options, 'SilentAimPrediction', Slider(Options, 'AimbotPredictScale', 8)),
        MaxDistance = Slider(Options, 'SilentAimMaxDistance', Slider(Options, 'AimbotMaxDistance', 300)),
        TargetBones = EnabledBones(Options, 'SilentAimBone') or EnabledBones(Options, 'AimbotBone'),
        FOVFilled = Bool(Toggles, 'FOVFilled'),
        FOVSpinSpeed = Slider(Options, 'FOVSpinSpeed', 1),
        FOVThickness = Slider(Options, 'FOVThickness', 2),
        FOVTransparency = Slider(Options, 'FOVTransparency', 85),
        FOVFillTransp = Slider(Options, 'FOVFillTransp', 85),
        OutlineColor1 = (Options.FOVColor and Options.FOVColor.Value) or Color3.new(1, 1, 1),
        OutlineColor2 = (Options.FOVColor2 and Options.FOVColor2.Value) or Color3.fromRGB(0, 200, 255),
        OutlineColor3 = (Options.FOVColor3 and Options.FOVColor3.Value) or Color3.fromRGB(255, 0, 255),
        FillColor1 = (Options.FOVFillColor and Options.FOVFillColor.Value) or Color3.fromRGB(0, 200, 255),
        FillColor2 = (Options.FOVFillColor2 and Options.FOVFillColor2.Value) or Color3.fromRGB(0, 90, 255),
        FillColor3 = (Options.FOVFillColor3 and Options.FOVFillColor3.Value) or Color3.fromRGB(255, 100, 0),
    }
end

local function IsValidTarget(player, opts)
    if not player or player == LocalPlayer then return false end
    if not player.Character then return false end
    local humanoid = player.Character:FindFirstChild('Humanoid')
    if not humanoid or humanoid.Health <= 0 then return false end
    if opts.TeamCheck and player.Team ~= nil and LocalPlayer.Team ~= nil and player.Team == LocalPlayer.Team then return false end
    return true
end

local function GetClosestTarget(opts)
    local closest, shortestDist = nil, math.huge
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    for _, player in ipairs(Players:GetPlayers()) do
        if IsValidTarget(player, opts) then
            for _, boneName in ipairs(opts.TargetBones) do
                local part = player.Character:FindFirstChild(boneName)
                if part then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        if dist < shortestDist and dist <= opts.FOVRadius then
                            local blocked = false
                            if opts.WallCheck then
                                local rayParams = RaycastParams.new()
                                rayParams.FilterDescendantsInstances = { LocalPlayer.Character, Camera }
                                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                                local ray = workspace:Raycast(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * opts.MaxDistance, rayParams)
                                if ray and ray.Instance and not ray.Instance:IsDescendantOf(player.Character) then
                                    blocked = true
                                end
                            end
                            if not blocked then
                                shortestDist = dist
                                closest = { Player = player, Part = part, ScreenPos = Vector2.new(screenPos.X, screenPos.Y) }
                            end
                        end
                    end
                end
            end
        end
    end
    return closest
end

local fovOutline = Drawing.new('Circle')
fovOutline.Visible = false
fovOutline.Filled = false
fovOutline.NumSides = 64
local fovFill = Drawing.new('Circle')
fovFill.Visible = false
fovFill.Filled = true
fovFill.NumSides = 64
local spinHue = 0

local function SpinColor(c1, c2, c3, t)
    local colors = { c1, c2, c3 }
    local segment = (math.floor(t) % 3) + 1
    local base = colors[segment]
    local h, s, v = base:ToHSV()
    return Color3.fromHSV((h + (t % 1) * 0.15) % 1, s, v)
end

local function PredictPosition(opts, target)
    local pos = target.Part.Position
    if opts.Prediction > 0 and target.Player and target.Player.Character then
        local Humanoid = target.Player.Character:FindFirstChild('Humanoid')
        if Humanoid then
            pos = pos + Humanoid.MoveDirection * (opts.Prediction / 10)
        end
    end
    return pos
end

local lastHitNotify = 0
local function DoHitNotify()
    local now = os.clock()
    if now - lastHitNotify < 0.2 then return end
    lastHitNotify = now
    pcall(function()
        if bc and bc.Notify then bc:Notify('Hit') end
    end)
end

RunService.RenderStepped:Connect(function(delta)
    local opts = GetOptions()
    local GuiInset = game:GetService("GuiService"):GetGuiInset()
    local mousePos = Vector2.new(Mouse.X, Mouse.Y + GuiInset.Y)
    fovFill.Visible = false
    fovOutline.Visible = false
    if opts.FOVEnabled then
        fovOutline.Visible = true
        fovOutline.Radius = opts.FOVRadius
        fovOutline.Position = mousePos
        fovOutline.Thickness = opts.FOVThickness
        fovOutline.Transparency = 1 - (opts.FOVTransparency / 100)
        if opts.FOVSpinSpeed > 0 then
            spinHue = (spinHue + opts.FOVSpinSpeed * delta * 120) % 360
            fovOutline.Color = SpinColor(opts.OutlineColor1, opts.OutlineColor2, opts.OutlineColor3, spinHue / 120)
            fovFill.Color = SpinColor(opts.FillColor1, opts.FillColor2, opts.FillColor3, spinHue / 120)
        else
            fovOutline.Color = opts.OutlineColor1
            fovFill.Color = opts.FillColor1
        end
        if opts.FOVFilled then
            fovFill.Visible = true
            fovFill.Radius = opts.FOVRadius
            fovFill.Position = mousePos
            fovFill.Thickness = 1
            fovFill.Transparency = 1 - (opts.FOVFillTransp / 100)
        end
    end
end)

local oldNamecall, oldIndex
if hookmetamethod and getnamecallmethod then
    oldNamecall = hookmetamethod(game, '__namecall', function(self, ...)
        local method = getnamecallmethod()
        if method ~= 'FireServer' and method ~= 'InvokeServer' then
            return oldNamecall(self, ...)
        end
        local namecallArgs = { ... }
        local newArgs
        local ok = pcall(function()
            local opts = GetOptions()
            if not opts.SilentAimActive then return end
            if typeof(self) ~= 'Instance' then return end
            local lower = string.lower(self.Name or '')
            if not (lower:find('shoot') or lower:find('fire') or lower:find('attack') or lower:find('hit')) then return end
            local target = GetClosestTarget(opts)
            if not target or not target.Part then return end
            newArgs = namecallArgs
            local pos = PredictPosition(opts, target)
            for i, arg in ipairs(newArgs) do
                if typeof(arg) == 'Vector3' then
                    newArgs[i] = pos
                elseif typeof(arg) == 'CFrame' then
                    newArgs[i] = CFrame.lookAt(arg.Position, pos)
                elseif typeof(arg) == 'Instance' and arg:IsA('BasePart') then
                    newArgs[i] = target.Part
                end
            end
            if opts.HitNotify then DoHitNotify() end
        end)
        if ok and newArgs then
            return oldNamecall(self, table.unpack(newArgs))
        end
        return oldNamecall(self, ...)
    end)
end

if hookmetamethod then
    oldIndex = hookmetamethod(game, '__index', function(self, key)
        if self ~= Mouse then
            return oldIndex(self, key)
        end
        if key ~= 'Hit' and key ~= 'Target' then
            return oldIndex(self, key)
        end
        local ok, res = pcall(function()
            local opts = GetOptions()
            if not opts.SilentAim then return nil end
            local target = GetClosestTarget(opts)
            if not target or not target.Part then return nil end
            if key == 'Target' then return target.Part end
            return target.Part.CFrame
        end)
        if ok and res ~= nil then
            return res
        end
        return oldIndex(self, key)
    end)
end

bc:OnUnload(function()
    pcall(function()
        if fovOutline then fovOutline:Remove() end
        if fovFill then fovFill:Remove() end
        if oldNamecall then hookmetamethod(game, '__namecall', oldNamecall) end
        if oldIndex then hookmetamethod(game, '__index', oldIndex) end
    end)
end)

-- watermark + keybind list
bc.ToggleKeybind = Options.MenuKeybind
if bc.KeybindFrame then
    bc.KeybindFrame.Visible = false
end
bc.KeypickerListVisible = false
if bc.SetWatermarkVisibility then bc:SetWatermarkVisibility(true) end
if bc.SetWatermark then bc:SetWatermark('creep.cc') end

bc:OnUnload(function()
    bc.Unloaded = true
end)

return function()
    bc:Unload()
end
