--check if game is loaded
while not game:IsLoaded() do task.wait(0.1) end

local ac = (gethui and gethui()) or game:GetService("CoreGui")

-- ui links
local bc = loadstring(game:HttpGet('https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/Source.lua'))()
local ci = loadstring(game:HttpGet('https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/addons/ThemeManager.lua'))()
local bx = loadstring(game:HttpGet('https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/addons/SaveManager.lua'))()

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
    Combat     = dc:AddTab('Combat'),
    Triggerbot = dc:AddTab('Triggerbot'),
    Visuals    = dc:AddTab('Visuals'),
    Performance= dc:AddTab('Performance'),
    Skin       = dc:AddTab('Skin'),
    Misc       = dc:AddTab('Misc'),
    ['Ui']     = dc:AddTab('Ui'),
}

-- create groupbox
local q = ch.Combat:AddLeftGroupbox('Silent Aim')
local o = ch.Combat:AddRightGroupbox('Aimbot')
local p = ch.Combat:AddRightGroupbox('FOV Settings')

-- Silent Aim (Rage)
q:AddToggle('SilentAimEnabled',  { Text = 'Silent Aim',    Default = false, Callback = function() end })
q:AddToggle('SilentAimFOV',      { Text = 'FOV Silent Aim', Default = false, Callback = function() end })
q:AddToggle('SilentAimWallcheck', { Text = 'Wallcheck',  Default = false, Callback = function() end })
q:AddToggle('SilentAimTeamCheck', { Text = 'Team Check', Default = false, Callback = function() end })
q:AddDropdown('SilentAimBone', {
    Text = 'Target Bone', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
    Callback = function() end,
})
q:AddSlider('SilentAimMaxDistance', { Text = 'Max Distance', Default = 300, Min = 50, Max = 1000, Rounding = 0, Suffix = ' studs', Callback = function() end })
q:AddSlider('SilentAimPrediction',  { Text = 'Prediction', Default = 8, Min = 1, Max = 30, Rounding = 0, Callback = function() end })
q:AddToggle('HitNotify',            { Text = 'Hit Notify', Default = false, Callback = function() end })

-- Aimbot (Legit)
o:AddToggle('AimbotEnabled',   { Text = 'Enabled',    Default = false, Callback = function() end })
 :AddKeyPicker('AimbotKey',    { Default = 'None', Mode = 'Hold', Text = 'Aimbot', NoUI = false, Callback = function() end, ChangedCallback = function() end })
o:AddToggle('AimbotWallcheck', { Text = 'Wallcheck',  Default = false, Callback = function() end })
o:AddToggle('AimbotPrediction',{ Text = 'Prediction', Default = false, Callback = function() end })
o:AddToggle('AimbotSticky',    { Text = 'Sticky Aim', Default = false, Callback = function() end })
o:AddToggle('AimbotTeamCheck', { Text = 'Team Check', Default = false, Callback = function() end })
o:AddDropdown('AimbotBone', {
    Text = 'Target Bone', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
    Callback = function() end,
})
o:AddSlider('AimbotFOV',            { Text = 'FOV',             Default = 120, Min = 30,  Max = 500,  Rounding = 0, Suffix = ' px',    Callback = function() end })
o:AddSlider('AimbotSmoothing',      { Text = 'Smoothing',       Default = 15,  Min = 1,   Max = 100,  Rounding = 0,                    Callback = function() end })
o:AddSlider('AimbotSensitivity',    { Text = 'Sensitivity',     Default = 1,   Min = 0.1, Max = 2,    Rounding = 1,                    Callback = function() end })
o:AddSlider('AimbotMaxDistance',    { Text = 'Max Distance',    Default = 300, Min = 50,  Max = 1000, Rounding = 0, Suffix = ' studs', Callback = function() end })
o:AddSlider('AimbotPredictScale',   { Text = 'Predict Strength',Default = 8,   Min = 1,   Max = 30,   Rounding = 0,                    Callback = function() end })

-- FOV Visual Settings
p:AddToggle('FOVEnabled',        { Text = 'Show FOV Circle', Default = false, Callback = function() end })
p:AddToggle('FOVFilled',            { Text = 'FOV Filled',      Default = false, Callback = function() end })
p:AddSlider('FOVThickness',         { Text = 'FOV Thickness',   Default = 2,  Min = 1, Max = 10,  Rounding = 0, Callback = function() end })
p:AddSlider('FOVTransparency',      { Text = 'FOV Transp',      Default = 85, Min = 0, Max = 100, Rounding = 0, Callback = function() end })
p:AddSlider('FOVFillTransp',        { Text = 'FOV Fill Transp', Default = 85, Min = 0, Max = 100, Rounding = 0, Callback = function() end })
p:AddSlider('FOVSpinSpeed',         { Text = 'FOV Spin Speed',  Default = 1,  Min = 0.1, Max = 10, Rounding = 1, Callback = function() end })
p:AddLabel('FOV Outline Color 1'):AddColorPicker('FOVColor',   { Default = Color3.new(1,1,1),         Callback = function() end })
p:AddLabel('FOV Outline Color 2'):AddColorPicker('FOVColor2',  { Default = Color3.fromRGB(0,200,255), Callback = function() end })
p:AddLabel('FOV Outline Color 3'):AddColorPicker('FOVColor3',  { Default = Color3.fromRGB(255,0,255), Callback = function() end })
p:AddLabel('FOV Fill Color 1'):AddColorPicker('FOVFillColor',  { Default = Color3.fromRGB(0,200,255), Callback = function() end })
p:AddLabel('FOV Fill Color 2'):AddColorPicker('FOVFillColor2', { Default = Color3.fromRGB(0,90,255),  Callback = function() end })
p:AddLabel('FOV Fill Color 3'):AddColorPicker('FOVFillColor3', { Default = Color3.fromRGB(255,100,0), Callback = function() end })

local ck = ch.Triggerbot:AddLeftGroupbox('Triggerbot')
local cj = ch.Triggerbot:AddRightGroupbox('Settings')

ck:AddToggle('TriggerbotEnabled',    { Text = 'Enabled',     Default = false, Callback = function() end })
  :AddKeyPicker('TriggerbotKey',     { Default = 'None', Mode = 'Hold', Text = 'Triggerbot', NoUI = false, Callback = function() end, ChangedCallback = function() end })
ck:AddToggle('TriggerbotFOVEnabled', { Text = 'FOV',         Default = false, Callback = function() end })
ck:AddToggle('TriggerbotScopeCheck', { Text = 'Scope Check', Default = false, Callback = function() end })
ck:AddToggle('KatanaCheck',          { Text = 'Anti Katana', Default = false, Callback = function() end })
ck:AddDropdown('TriggerbotBone', {
    Text = 'Hitbox', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
    Callback = function() end,
})

cj:AddSlider('TriggerbotRadius',         { Text = 'Radius',      Default = 25,  Min = 1,   Max = 100, Rounding = 0, Suffix = ' px', Callback = function() end })
cj:AddSlider('TriggerbotMinDelay',       { Text = 'Min Delay',   Default = 50,  Min = 0,   Max = 500, Rounding = 0, Suffix = ' ms', Callback = function() end })
cj:AddSlider('TriggerbotMaxDelay',       { Text = 'Max Delay',   Default = 120, Min = 0,   Max = 500, Rounding = 0, Suffix = ' ms', Callback = function() end })
cj:AddSlider('TriggerbotClickHold',      { Text = 'Base Delay',  Default = 30,  Min = 10,  Max = 150, Rounding = 0, Suffix = ' ms', Callback = function() end })
cj:AddLabel('FOV Outline 1'):AddColorPicker('TriggerbotFOVColor',  { Default = Color3.new(1,0,0),           Callback = function() end })
cj:AddLabel('FOV Outline 2'):AddColorPicker('TriggerbotFOVColor2', { Default = Color3.fromRGB(255,120,120), Callback = function() end })
cj:AddSlider('TriggerbotFOVThickness',   { Text = 'FOV Thickness',Default = 2,  Min = 1, Max = 10,  Rounding = 0, Callback = function() end })
cj:AddSlider('TriggerbotFOVTransparency',{ Text = 'FOV Transp',   Default = 50, Min = 0, Max = 100, Rounding = 0, Callback = function() end })
cj:AddToggle('TriggerbotFOVFilled',      { Text = 'FOV Filled',   Default = false, Callback = function() end })
cj:AddLabel('FOV Fill 1'):AddColorPicker('TriggerbotFOVFillColor',  { Default = Color3.fromRGB(255,0,0), Callback = function() end })
cj:AddLabel('FOV Fill 2'):AddColorPicker('TriggerbotFOVFillColor2', { Default = Color3.fromRGB(120,0,0), Callback = function() end })
cj:AddSlider('TriggerbotFOVFillTransp',  { Text = 'FOV Fill Transp',Default = 60, Min = 0, Max = 100, Rounding = 0, Callback = function() end })
cj:AddSlider('TriggerbotFOVSpinSpeed',   { Text = 'FOV Spin Speed', Default = 1, Min = 0.1, Max = 10, Rounding = 1, Callback = function() end })

local ag = ch.Visuals:AddLeftGroupbox('ESP')
local ah = ch.Visuals:AddRightGroupbox('Settings')

ag:AddToggle('ESPEnabled',      { Text = 'ESP Enabled',    Default = false, Callback = function() end })
ag:AddToggle('ESPBox',          { Text = 'Box',            Default = false, Callback = function() end })
ag:AddToggle('ESPCornerBox',    { Text = 'Corner Box',     Default = false, Callback = function() end })
ag:AddToggle('ESPFilled',       { Text = 'Filled Box',     Default = false, Callback = function() end })
ag:AddToggle('ESPDistance',     { Text = 'Distance',       Default = false, Callback = function() end })
ag:AddToggle('ESPSkeleton',     { Text = 'Skeleton',       Default = false, Callback = function() end })
ag:AddToggle('ShowFriendlyESP', { Text = 'Show Friendlies',Default = false, Callback = function() end })
ag:AddDropdown('ESPAnimMode', {
    Text = 'Animation Mode', Default = 'Spinning Gradient',
    Values = { 'Static','Rainbow','Spinning Gradient','Pulse' },
    Callback = function() end,
})
ag:AddSlider('ESPAnimSpeed', { Text = 'Animation Speed', Default = 1, Min = 0.1, Max = 10, Rounding = 1, Callback = function() end })

ah:AddSlider('ESPMaxDistance',       { Text = 'Max Distance',   Default = 300, Min = 50, Max = 1000, Rounding = 0, Suffix = ' studs', Callback = function() end })
ah:AddSlider('ESPBoxThickness',      { Text = 'Box Thickness',  Default = 1,   Min = 1,  Max = 5,    Rounding = 0,                    Callback = function() end })
ah:AddSlider('ESPSkeletonThickness', { Text = 'Skeleton Thick', Default = 1,   Min = 1,  Max = 5,    Rounding = 0,                    Callback = function() end })
ah:AddSlider('ESPFillTransp',        { Text = 'Fill Transp',    Default = 70,  Min = 0,  Max = 100,  Rounding = 0,                    Callback = function() end })
ah:AddLabel('Visible Color'):AddColorPicker('ESPVisibleColor',     { Default = Color3.new(0,1,0),          Callback = function() end })
ah:AddLabel('Hidden Color'):AddColorPicker('ESPInvisibleColor',    { Default = Color3.new(1,0,0),          Callback = function() end })
ah:AddLabel('Distance Color'):AddColorPicker('ESPDistanceColor',   { Default = Color3.new(1,1,1),          Callback = function() end })
ah:AddLabel('Gradient Color 2'):AddColorPicker('ESPGradientColor2',{ Default = Color3.fromRGB(0,200,255),  Callback = function() end })

local cz = ch.Visuals:AddRightGroupbox('Weapon Chams')
cz:AddToggle('WeaponChamsEnabled', { Text = 'Enabled', Default = false, Callback = function() end })
cz:AddDropdown('WeaponChamsMaterial', {
    Text = 'Material', Default = 'ForceField',
    Values = { 'ForceField','Neon','Glass','SmoothPlastic','Metal','Wood','Marble','Granite','Brick','Cobblestone' },
    Callback = function() end,
})
cz:AddSlider('WeaponChamsTransparency', { Text = 'Transparency', Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = '%', Callback = function() end })
cz:AddLabel('Color'):AddColorPicker('WeaponChamsColor', { Default = Color3.new(1,1,1), Callback = function() end })

local ax = ch.Visuals:AddLeftGroupbox('Bullet Tracers')
ax:AddToggle('HitTracersEnabled', { Text = 'Enabled', Default = false, Callback = function() end })
ax:AddLabel('Color'):AddColorPicker('HitTracerColor', { Default = Color3.fromRGB(0,255,255), Callback = function() end })
ax:AddSlider('HitTracerThickness', { Text = 'Thickness', Default = 8,  Min = 1, Max = 50,  Rounding = 0, Callback = function() end })
ax:AddSlider('HitTracerLifetime',  { Text = 'Lifetime',  Default = 75, Min = 10,Max = 500, Rounding = 0, Suffix = ' ms', Callback = function() end })
ax:AddSlider('HitTracerFadeIn',    { Text = 'Fade In',   Default = 5,  Min = 0, Max = 200, Rounding = 0, Suffix = ' ms', Callback = function() end })
ax:AddSlider('HitTracerFadeOut',   { Text = 'Fade Out',  Default = 35, Min = 0, Max = 300, Rounding = 0, Suffix = ' ms', Callback = function() end })

local ct = ch.Visuals:AddLeftGroupbox('Utility ESP')
ct:AddToggle('UtilityESPEnabled', { Text = 'Enabled', Default = false, Callback = function() end })
ct:AddToggle('UtilityESPName',    { Text = 'Name',    Default = true,  Callback = function() end })
ct:AddToggle('UtilityESPGlow',    { Text = 'Glow',    Default = true,  Callback = function() end })
ct:AddLabel('Color'):AddColorPicker('UtilityESPColor', { Default = Color3.fromRGB(0,255,120), Callback = function() end })

local be = ch.Visuals:AddLeftGroupbox('Lighting Changer')
be:AddToggle('LightingChangerEnabled', { Text = 'Enabled',    Default = false, Callback = function() end })
be:AddSlider('LightingBrightness',     { Text = 'Brightness', Default = 2,  Min = 0,  Max = 10, Rounding = 1, Callback = function() end })
be:AddSlider('LightingClockTime',      { Text = 'Time',       Default = 14, Min = 0,  Max = 24, Rounding = 1, Callback = function() end })
be:AddSlider('LightingExposure',       { Text = 'Exposure',   Default = 0,  Min = -5, Max = 5,  Rounding = 1, Callback = function() end })
be:AddLabel('Ambient'):AddColorPicker('LightingAmbient',               { Default = Color3.fromRGB(128,128,128), Callback = function() end })
be:AddLabel('Outdoor Ambient'):AddColorPicker('LightingOutdoorAmbient',{ Default = Color3.fromRGB(128,128,128), Callback = function() end })
be:AddLabel('Color Shift Top'):AddColorPicker('LightingColorShiftTop',    { Default = Color3.new(0,0,0), Callback = function() end })
be:AddLabel('Color Shift Bottom'):AddColorPicker('LightingColorShiftBottom',{ Default = Color3.new(0,0,0), Callback = function() end })

local ca = ch.Visuals:AddRightGroupbox('Skybox Changer')
ca:AddDropdown('SkyboxSelection', {
    Text = 'Skybox', Default = 1,
    Values = { "Minecraft","Dreaming","Space","Cartoony","Night","Pink","Red","Purple","Milkyway","Galaxy","Anime" },
    Callback = function() end,
})

local bn = ch.Performance:AddLeftGroupbox('Performance')
bn:AddSlider('RaycastUpdateRate', {
    Text = 'Raycast Delay', Default = 50, Min = 0, Max = 500, Rounding = 0,
    Suffix = ' ms', Tooltip = '(higher = better FPS, lower = more accurate)',
    Callback = function() end,
})

local by = ch.Skin:AddLeftGroupbox('Skin Changer')
by:AddToggle('UseUnlockAll',  { Text = 'Use Unlock All', Default = false, Callback = function() end })
by:AddDropdown('SkinCategory',{
    Text = 'Category', Default = 1,
    Values = { 'assault_rifle','sniper_rifle','shotgun','pistol','launcher','heavy','grenades','utility','melee' },
    Callback = function() end,
})
by:AddDropdown('SkinWeapon',  { Text = 'Weapon', Default = 1, Values = { 'ak47' }, Callback = function() end })
by:AddDropdown('SkinName',    { Text = 'Skin',   Default = 1, Values = { '' },     Callback = function() end })
by:AddButton('Apply Skin', function() end)

local bk = ch.Misc:AddLeftGroupbox('Hitsounds')
local soundList = { 'Normal','Neverlose','Gamesense','Fatality','Splash','Thonk','Cowbell','Slap','Tung','Hit','Ding','Chicken','Moan','Girl','Cat Girl','Tiki Tiki','Jew','Fart','Bubble','Tf2','Cs2','Mambo','Toma','Kirk','Plastic','Lego','67' }
bk:AddDropdown('HitSoundHead',    { Text = 'Head',        Default = 'Normal', Values = soundList, Callback = function() end })
bk:AddSlider('HitSoundHeadVolume',{ Text = 'Head Volume', Default = 1, Min = 0, Max = 10, Rounding = 1, Callback = function() end })
bk:AddDropdown('HitSoundBody',    { Text = 'Body',        Default = 'Normal', Values = soundList, Callback = function() end })
bk:AddSlider('HitSoundBodyVolume',{ Text = 'Body Volume', Default = 1, Min = 0, Max = 10, Rounding = 1, Callback = function() end })
bk:AddDropdown('HitSoundKill',    { Text = 'Kill',        Default = 'Normal', Values = soundList, Callback = function() end })
bk:AddSlider('HitSoundKillVolume',{ Text = 'Kill Volume', Default = 1, Min = 0, Max = 10, Rounding = 1, Callback = function() end })

local ay_group = ch.Misc:AddLeftGroupbox('Dummy Settings')
ay_group:AddToggle('AllowDummys', { Text = 'Allow Dummys', Default = false, Callback = function() end })

local bj = ch['Ui']:AddLeftGroupbox('Menu')
bj:AddButton('Unload', function() bc:Unload() end)
bj:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'RightShift',
    NoUI = true,
    Text = 'Menu keybind',
    ChangedCallback = function()
bc.ToggleKeybind = Options.MenuKeybind
-- older library copies ignore ToggleKeybind and hardcode RightShift;
-- handle the toggle ourselves so the newly bound key works regardless
if not bc.SetKeybindTransparency then
    game:GetService('UserInputService').InputBegan:Connect(function(Input)
        if bc.Unloaded then return end
        if Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
        local Bind = bc.ToggleKeybind
        local KeyName = (type(Bind) == 'table' and Bind.Value) or Bind
        if KeyName and Input.KeyCode.Name == KeyName then
            task.spawn(bc.Toggle)
        end
    end)
end
    end,
})
bj:AddToggle('ShowKeybinds', { Text = 'Show Keybinds', Default = false, Callback = function(v) bc.KeybindFrame.Visible = v end })
bj:AddToggle('ShowWatermark',{ Text = 'Show Watermark', Default = true,  Callback = function(v) bc:SetWatermarkVisibility(v) end })

-- background adjustors
local bg = ch['Ui']:AddLeftGroupbox('Background')
if bc.AddBlurSlider then bc:AddBlurSlider(bg) end
if bc.AddDarkenSlider then bc:AddDarkenSlider(bg) end
if bc.AddKeybindTransparencySlider then
    bc:AddKeybindTransparencySlider(bg)
elseif bc.KeybindFrame then
    bg:AddSlider('KeybindTransparency', {
        Text     = 'Keybind Transparency',
        Default  = 0,
        Min      = 0,
        Max      = 100,
        Rounding = 0,
        Suffix   = '%',
        Callback = function(Value)
            local Alpha = Value / 100
            local Outer = bc.KeybindFrame
            if Outer then
                Outer.BackgroundTransparency = Alpha
                Outer.BorderSizePixel = Alpha >= 1 and 0 or 1
            end
            local Inner = bc.KeybindInner or (Outer and Outer:FindFirstChildOfClass('Frame'))
            if Inner then
                Inner.BackgroundTransparency = Alpha
                Inner.BorderSizePixel = Alpha >= 1 and 0 or 1
                pcall(function()
                    Inner:FindFirstChildOfClass('Frame').BackgroundTransparency = Alpha
                end)
            end
        end,
    })
end

-- notification options
if bc.NotifyConfig then
    local ng = ch['Ui']:AddLeftGroupbox('Notifications')
    ng:AddDropdown('NotificationBarSide', {
        Text = 'Notification Accent Bar Position',
        Default = bc.NotifyConfig.BarSide or 'Bottom',
        Values = { 'Top', 'Bottom', 'Left', 'Right' },
        Callback = function(Value)
            bc.NotifyConfig.BarSide = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddDropdown('NotificationAlignment', {
        Text = 'Notification Alignment',
        Default = bc.NotifyConfig.Alignment or 'Center',
        Values = { 'Left', 'Center', 'Right' },
        Callback = function(Value)
            bc.NotifyConfig.Alignment = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddSlider('NotificationPosX', {
        Text = 'Position X (%)', Default = bc.NotifyConfig.PosX or 50, Min = 0, Max = 100, Rounding = 0,
        Callback = function(Value)
            bc.NotifyConfig.PosX = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddSlider('NotificationPosY', {
        Text = 'Position Y (%)', Default = bc.NotifyConfig.PosY or 60, Min = 0, Max = 100, Rounding = 0,
        Callback = function(Value)
            bc.NotifyConfig.PosY = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddSlider('NotificationTransparency', {
        Text = 'Notification Transparency (%)', Default = bc.NotifyConfig.Transparency or 60, Min = 0, Max = 100, Rounding = 0,
        Callback = function(Value)
            bc.NotifyConfig.Transparency = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddSlider('NotificationMaxHeight', {
        Text = 'Max Height', Default = bc.NotifyConfig.MaxHeight or 200, Min = 50, Max = 500, Rounding = 0, Suffix = ' px',
        Callback = function(Value)
            bc.NotifyConfig.MaxHeight = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddToggle('NotificationClipDescendants', {
        Text = 'Clip Descendants', Default = bc.NotifyConfig.ClipDescendants or false,
        Callback = function(Value)
            bc.NotifyConfig.ClipDescendants = Value
            if bc.ConfigureNotifications then bc:ConfigureNotifications() end
        end,
    })
    ng:AddDropdown('NotificationSortOrder', {
        Text = 'Sort Order', Default = bc.NotifyConfig.SortOrder or 'Time',
        Values = { 'Time', 'Text Length' },
        Callback = function(Value)
            bc.NotifyConfig.SortOrder = Value
        end,
    })
    ng:AddButton('Test Notification', function()
        bc:Notify('Test Notification')
    end)
end

-- save manager
ci:SetLibrary(bc)
bx:SetLibrary(bc)
bx:IgnoreThemeSettings()
bx:SetIgnoreIndexes({})
ci:SetFolder('logic')
bx:SetFolder('logic/entities')
bx:BuildConfigSection(ch['Ui'])
ci:ApplyToTab(ch['Ui'])
ci:ApplyTheme('Logic')

-- silent aim & fov logic
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

-- create watermark
bc.ToggleKeybind = Options.MenuKeybind
bc.KeybindFrame.Visible = false
bc:SetWatermarkVisibility(true)
bc:SetWatermark('creep.cc')
bc:OnUnload(function()
    bc.Unloaded = true
end)

-- unload
return function()
    bc:Unload()
end
