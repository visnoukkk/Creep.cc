# CreepDotCCLib
A Roblox UI library inspired by Splix, BBot, LinoriaLib and many others.

###### Example Script: 
* [Example](Example.lua)

###### Interface Addons:
* [Theme Manager](ThemeManager.lua)&nbsp;&nbsp;|&nbsp;&nbsp;[Settings](Settings.lua) 

## Features
- Tabs, group boxes, and tab boxes
- Almost any UI element you would ever need (toggles, sliders, dropdowns, etc)
- Interface automatically becomes scrollable whenever there are too many UI elements
- Dependency boxes, allowing you to easily hide/show UI elements depending on the state of other UI elements
- Bar Above Tab, effeciently color and themed like unnamed enhancements.
- Middle Title Name, and Game Name, feels like a good UI.
- Mobile Support, can support mobile and computer.

## Contributors
- Visnouk: Main developer.
- iloveyouimgay: Expanding Features, Making UI Better, and fixing bugs.

## Quick Start
### Reading UI Values

Access element values via `Toggles` or `Options`:

```lua
-- Toggles store their state in Toggles[Idx].Value (Boolean)
if Toggles.AimbotEnabled.Value then
    print("Aimbot is ON")
end

-- Sliders, Dropdowns, and ColorPickers store state in Options[Idx].Value
local currentFOV = Options.AimbotFOV.Value           -- Returns a Number (e.g., 120)
local selectedBone = Options.AimbotBone.Value        -- Returns a Table (since Multi = true)
local visibleColor = Options.ESPVisibleColor.Value   -- Returns a Color3 object

-- KeyPickers store key details and activation state
local isAimbotKeyPressed = Options.AimbotKey:GetState() -- Returns Boolean (true if held/active)

```

---

### UI Element Syntax & Event Callbacks

#### 1. Toggles

Use `Callback` to fire code whenever the state switches, or read `Toggles.Idx.Value` inside a loop/event.

```lua
q:AddToggle('AimbotEnabled', {
    Text = 'Enabled',
    Default = false,
    Callback = function(Value)
        -- Value is a boolean (true / false)
        print("Aimbot toggled:", Value)
    end
})

```

#### 2. Key Pickers

Keybinds attached directly to toggles via chaining:

```lua
q:AddToggle('AimbotEnabled', { Text = 'Enabled', Default = false })
 :AddKeyPicker('AimbotKey', {
    Default = 'MB2', -- Right Mouse Button, 'E', 'LeftAlt', etc.
    Mode = 'Hold',   -- Modes: 'Hold', 'Toggle', 'Always'
    Text = 'Aimbot Key',
    Callback = function(Value)
        -- Value returns true when active, false when released
    end
})

```

#### 3. Sliders

```lua
o:AddSlider('AimbotFOV', {
    Text = 'FOV',
    Default = 120,
    Min = 30,
    Max = 500,
    Rounding = 0, -- Decimal places (0 = integers)
    Suffix = ' px',
    Callback = function(Value)
        print("FOV set to:", Value)
    end
})

```

#### 4. Dropdowns (Single & Multi-Select)

```lua
-- Single Select
ca:AddDropdown('SkyboxSelection', {
    Text = 'Skybox',
    Default = 'Minecraft',
    Values = { 'Minecraft', 'Space', 'Galaxy' },
    Callback = function(Value)
        print("Selected Skybox:", Value) -- Value is a string
    end
})

-- Multi-Select
q:AddDropdown('AimbotBone', {
    Text = 'Target Bone',
    Default = { 'Head' },
    Multi = true,
    Values = { 'Head', 'UpperTorso', 'LowerTorso' },
    Callback = function(Value)
        -- Value is a table containing selected items dictionary: { Head = true, UpperTorso = true }
    end
})

```

#### 5. Color Pickers

Color pickers can attach directly to labels or sliders:

```lua
o:AddLabel('FOV Color'):AddColorPicker('FOVColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        -- Value is a Color3 object
        print("Selected Color:", Value)
    end
})

```

---

### Programmatically Setting UI States

Update elements dynamically from code without user interaction:

```lua
-- Toggle setting
Toggles.AimbotEnabled:SetValue(true)

-- Slider setting
Options.AimbotFOV:SetValue(200)

-- ColorPicker setting
Options.FOVColor:SetValue(Color3.fromRGB(255, 0, 0))

-- Dropdown setting
Options.SkyboxSelection:SetValue('Space')

```
