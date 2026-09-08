-- check if game is loaded
while not game:IsLoaded() do task.wait(0.1) end

local ac = (gethui and gethui()) or game:GetService("CoreGui")

-- ui links
local bc = loadstring(game:HttpGet('https://raw.githubusercontent.com/visnoukkk/UELinoriaLib/refs/heads/main/Source.lua'))()
local ci = loadstring(game:HttpGet('https://raw.githubusercontent.com/visnoukkk/UELinoriaLib/refs/heads/main/addons/ThemeManager.lua'))()
local bx = loadstring(game:HttpGet('https://raw.githubusercontent.com/visnoukkk/UELinoriaLib/refs/heads/main/addons/SaveManager.lua'))()

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
    Aiming     = dc:AddTab('Aiming'),
    Triggerbot = dc:AddTab('Triggerbot'),
    Visuals    = dc:AddTab('Visuals'),
    Performance= dc:AddTab('Performance'),
    Skin       = dc:AddTab('Skin'),
    Misc       = dc:AddTab('Misc'),
    ['Ui']     = dc:AddTab('Ui'),
}

-- create groupbox
local q = ch.Aiming:AddLeftGroupbox('Aimbot')
local o = ch.Aiming:AddRightGroupbox('Settings')

-- create toggles
q:AddToggle('AimbotEnabled',   { Text = 'Enabled',    Default = false, Callback = function() end })
 :AddKeyPicker('AimbotKey',    { Default = 'None', Mode = 'Hold', Text = 'Aimbot', NoUI = false, Callback = function() end, ChangedCallback = function() end })
q:AddToggle('AimbotWallcheck', { Text = 'Wallcheck',  Default = false, Callback = function() end })
q:AddToggle('AimbotPrediction',{ Text = 'Prediction', Default = false, Callback = function() end })
q:AddToggle('AimbotSticky',    { Text = 'Sticky Aim', Default = false, Callback = function() end })
q:AddToggle('FOVEnabled',      { Text = 'FOV',        Default = false, Callback = function() end })
q:AddToggle('TeamCheck',       { Text = 'Team Check', Default = false, Callback = function() end })
q:AddDropdown('AimbotBone', {
    Text = 'Target Bone', Default = 1, Multi = true,
    Values = { 'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','LeftHand','RightUpperArm','RightLowerArm','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot' },
    Callback = function() end,
})

o:AddSlider('AimbotFOV',            { Text = 'FOV',             Default = 120, Min = 30,  Max = 500,  Rounding = 0, Suffix = ' px',    Callback = function() end })
o:AddSlider('AimbotSmoothing',      { Text = 'Smoothing',       Default = 15,  Min = 1,   Max = 100,  Rounding = 0,                    Callback = function() end })
o:AddSlider('AimbotSensitivityify', { Text = 'Sensitivity',     Default = 1,   Min = 0.1, Max = 2,    Rounding = 1,                    Callback = function() end })
o:AddSlider('AimbotMaxDistance',    { Text = 'Max Distance',    Default = 300, Min = 50,  Max = 1000, Rounding = 0, Suffix = ' studs', Callback = function() end })
o:AddSlider('AimbotPredictScale',   { Text = 'Predict Strength',Default = 8,   Min = 1,   Max = 30,   Rounding = 0,                    Callback = function() end })
o:AddLabel('FOV Outline Color 1'):AddColorPicker('FOVColor',   { Default = Color3.new(1,1,1),         Callback = function() end })
o:AddLabel('FOV Outline Color 2'):AddColorPicker('FOVColor2',  { Default = Color3.fromRGB(0,200,255), Callback = function() end })
o:AddSlider('FOVThickness',         { Text = 'FOV Thickness',   Default = 2,  Min = 1, Max = 10,  Rounding = 0, Callback = function() end })
o:AddSlider('FOVTransparency',      { Text = 'FOV Transp',      Default = 85, Min = 0, Max = 100, Rounding = 0, Callback = function() end })
o:AddToggle('FOVFilled',            { Text = 'FOV Filled',      Default = false, Callback = function() end })
o:AddLabel('FOV Fill Color 1'):AddColorPicker('FOVFillColor',  { Default = Color3.fromRGB(0,200,255), Callback = function() end })
o:AddLabel('FOV Fill Color 2'):AddColorPicker('FOVFillColor2', { Default = Color3.fromRGB(0,90,255),  Callback = function() end })
o:AddSlider('FOVFillTransp',        { Text = 'FOV Fill Transp', Default = 85, Min = 0, Max = 100, Rounding = 0, Callback = function() end })
o:AddSlider('FOVSpinSpeed',         { Text = 'FOV Spin Speed',  Default = 1,  Min = 0.1, Max = 10, Rounding = 1, Callback = function() end })

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
        Text = 'Notification Accent Color Position',
        Default = bc.NotifyConfig.BarSide or 'Top',
        Values = { 'Top', 'Bottom', 'Left', 'Right' },
        Callback = function(Value)
            bc.NotifyConfig.BarSide = Value
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
