local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltimateMM2Script"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

if player:FindFirstChild("PlayerGui") then
    ScreenGui.Parent = player.PlayerGui
else
    player:WaitForChild("PlayerGui")
    ScreenGui.Parent = player.PlayerGui
end

local BackgroundDecal = Instance.new("ImageLabel")
BackgroundDecal.Name = "BackgroundDecal"
BackgroundDecal.Image = "rbxassetid://103402115168960"
BackgroundDecal.ScaleType = Enum.ScaleType.Crop
BackgroundDecal.BackgroundTransparency = 1
BackgroundDecal.Size = UDim2.new(1, 0, 1, 0)
BackgroundDecal.Position = UDim2.new(0, 0, 0, 0)
BackgroundDecal.ZIndex = 0

local BackgroundOverlay = Instance.new("Frame")
BackgroundOverlay.Name = "BackgroundOverlay"
BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
BackgroundOverlay.BackgroundTransparency = 0.6
BackgroundOverlay.Size = UDim2.new(1, 0, 1, 0)
BackgroundOverlay.Position = UDim2.new(0, 0, 0, 0)
BackgroundOverlay.ZIndex = 1

BackgroundDecal.Parent = ScreenGui
BackgroundOverlay.Parent = ScreenGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0, 520, 0, 620)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Active = true
MainFrame.Draggable = ScriptManager.IsGUIMovable
MainFrame.ZIndex = 10

local BorderGlow = Instance.new("UIStroke")
BorderGlow.Name = "BorderGlow"
BorderGlow.Color = Color3.fromRGB(150, 50, 100)
BorderGlow.Thickness = 2
BorderGlow.Transparency = 0.3
BorderGlow.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0.03, 0)
MainCorner.Parent = MainFrame

local InnerGlow = Instance.new("Frame")
InnerGlow.Name = "InnerGlow"
InnerGlow.BackgroundColor3 = Color3.fromRGB(100, 30, 60)
InnerGlow.BackgroundTransparency = 0.9
InnerGlow.Size = UDim2.new(1, -4, 1, -4)
InnerGlow.Position = UDim2.new(0, 2, 0, 2)
InnerGlow.ZIndex = 9

local InnerCorner = Instance.new("UICorner")
InnerCorner.CornerRadius = UDim.new(0.03, 0)
InnerCorner.Parent = InnerGlow
InnerGlow.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.BackgroundColor3 = Color3.fromRGB(40, 20, 25)
Header.Size = UDim2.new(1, 0, 0, 55)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.ZIndex = 11

local HeaderImage = Instance.new("ImageLabel")
HeaderImage.Name = "HeaderImage"
HeaderImage.Image = "rbxassetid://103402115168960"
HeaderImage.ScaleType = Enum.ScaleType.Crop
HeaderImage.BackgroundTransparency = 1
HeaderImage.Size = UDim2.new(1, 0, 1, 0)
HeaderImage.Position = UDim2.new(0, 0, 0, 0)
HeaderImage.ZIndex = 10

local HeaderOverlay = Instance.new("Frame")
HeaderOverlay.Name = "HeaderOverlay"
HeaderOverlay.BackgroundColor3 = Color3.fromRGB(80, 30, 50)
HeaderOverlay.BackgroundTransparency = 0.3
HeaderOverlay.Size = UDim2.new(1, 0, 1, 0)
HeaderOverlay.Position = UDim2.new(0, 0, 0, 0)
HeaderOverlay.ZIndex = 11

HeaderImage.Parent = Header
HeaderOverlay.Parent = Header

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 15, 25))
})
HeaderGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.5),
    NumberSequenceKeypoint.new(1, 0.7)
})
HeaderGradient.Parent = HeaderOverlay

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0.03, 0, 0, 0)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.BackgroundTransparency = 1
Title.Text = "🚀 ULTIMATE MM2 SCRIPT v2.1"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 200, 200)
Title.TextSize = 20
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 12

local TitleGlow = Instance.new("UIStroke")
TitleGlow.Color = Color3.fromRGB(255, 100, 100)
TitleGlow.Thickness = 2
TitleGlow.Transparency = 0.5
TitleGlow.Parent = Title

Title.Parent = Header

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Text = "✕"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 30, 35)
CloseButton.AutoButtonColor = true
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -40, 0.5, -17.5)
CloseButton.ZIndex = 12

local CloseGlow = Instance.new("UIStroke")
CloseGlow.Color = Color3.fromRGB(255, 50, 50)
CloseGlow.Thickness = 1
CloseGlow.Parent = CloseButton

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0.3, 0)
CloseCorner.Parent = CloseButton

CloseButton.Parent = Header

local TabsFrame = Instance.new("Frame")
TabsFrame.Name = "TabsFrame"
TabsFrame.BackgroundColor3 = Color3.fromRGB(25, 15, 25)
TabsFrame.Size = UDim2.new(1, 0, 0, 45)
TabsFrame.Position = UDim2.new(0, 0, 0, 55)
TabsFrame.ZIndex = 11

local TabsImage = Instance.new("ImageLabel")
TabsImage.Name = "TabsImage"
TabsImage.Image = "rbxassetid://103402115168960"
TabsImage.ScaleType = Enum.ScaleType.Crop
TabsImage.BackgroundTransparency = 1
TabsImage.Size = UDim2.new(1, 0, 1, 0)
TabsImage.Position = UDim2.new(0, 0, 0, 0)
TabsImage.ZIndex = 10

local TabsOverlay = Instance.new("Frame")
TabsOverlay.Name = "TabsOverlay"
TabsOverlay.BackgroundColor3 = Color3.fromRGB(25, 15, 25)
TabsOverlay.BackgroundTransparency = 0.4
TabsOverlay.Size = UDim2.new(1, 0, 1, 0)
TabsOverlay.Position = UDim2.new(0, 0, 0, 0)
TabsOverlay.ZIndex = 11

TabsImage.Parent = TabsFrame
TabsOverlay.Parent = TabsFrame

local TabsLayout = Instance.new("UIListLayout")
TabsLayout.FillDirection = Enum.FillDirection.Horizontal
TabsLayout.Padding = UDim.new(0, 0)
TabsLayout.Parent = TabsFrame

local tabNames = {"Combat", "ESP", "Auto Farm", "Settings"}
ScriptManager.TabButtons = {}

for i, tabName in ipairs(tabNames) do
    local tabButton = Instance.new("TextButton")
    tabButton.Name = tabName .. "Tab"
    tabButton.Text = tabName
    tabButton.Font = Enum.Font.GothamSemibold
    tabButton.TextColor3 = Color3.fromRGB(220, 220, 220)
    tabButton.BackgroundColor3 = (i == 1) and Color3.fromRGB(70, 40, 60) or Color3.fromRGB(40, 25, 35)
    tabButton.AutoButtonColor = false
    tabButton.Size = UDim2.new(0.25, 0, 1, 0)
    tabButton.ZIndex = 12
    
    local TabImage = Instance.new("ImageLabel")
    TabImage.Name = "TabImage"
    TabImage.Image = "rbxassetid://103402115168960"
    TabImage.ScaleType = Enum.ScaleType.Crop
    TabImage.BackgroundTransparency = 1
    TabImage.Size = UDim2.new(1, 0, 1, 0)
    TabImage.Position = UDim2.new(0, 0, 0, 0)
    TabImage.ZIndex = 11
    
    local TabOverlay = Instance.new("Frame")
    TabOverlay.Name = "TabOverlay"
    TabOverlay.BackgroundColor3 = tabButton.BackgroundColor3
    TabOverlay.BackgroundTransparency = 0.6
    TabOverlay.Size = UDim2.new(1, 0, 1, 0)
    TabOverlay.Position = UDim2.new(0, 0, 0, 0)
    TabOverlay.ZIndex = 12
    
    TabImage.Parent = tabButton
    TabOverlay.Parent = tabButton
    
    local TabGlow = Instance.new("UIStroke")
    TabGlow.Color = Color3.fromRGB(100, 50, 80)
    TabGlow.Thickness = 1
    TabGlow.Parent = tabButton
    
    ScriptManager.TabButtons[tabName] = tabButton
    tabButton.Parent = TabsFrame
end

local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Name = "ContentFrame"
ContentFrame.BackgroundTransparency = 1
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 50, 50)
ContentFrame.ScrollBarImageTransparency = 0.3
ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.Size = UDim2.new(1, -20, 1, -145)
ContentFrame.Position = UDim2.new(0, 10, 0, 105)
ContentFrame.ZIndex = 11

ScriptManager.TabContents = {}

local CombatTab = Instance.new("Frame")
CombatTab.Name = "CombatTab"
CombatTab.BackgroundTransparency = 1
CombatTab.Size = UDim2.new(1, 0, 0, 400)
CombatTab.Visible = true
CombatTab.ZIndex = 11

local CombatImage = Instance.new("ImageLabel")
CombatImage.Name = "CombatImage"
CombatImage.Image = "rbxassetid://103402115168960"
CombatImage.ScaleType = Enum.ScaleType.Crop
CombatImage.BackgroundTransparency = 1
CombatImage.Size = UDim2.new(1, 0, 1, 0)
CombatImage.Position = UDim2.new(0, 0, 0, 0)
CombatImage.ZIndex = 10

local CombatOverlay = Instance.new("Frame")
CombatOverlay.Name = "CombatOverlay"
CombatOverlay.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
CombatOverlay.BackgroundTransparency = 0.7
CombatOverlay.Size = UDim2.new(1, 0, 1, 0)
CombatOverlay.Position = UDim2.new(0, 0, 0, 0)
CombatOverlay.ZIndex = 11

CombatImage.Parent = CombatTab
CombatOverlay.Parent = CombatTab

local CombatLayout = Instance.new("UIListLayout")
CombatLayout.Padding = UDim.new(0, 10)
CombatLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
CombatLayout.Parent = CombatTab

local ESPTab = Instance.new("Frame")
ESPTab.Name = "ESPTab"
ESPTab.BackgroundTransparency = 1
ESPTab.Size = UDim2.new(1, 0, 0, 300)
ESPTab.Visible = false
ESPTab.ZIndex = 11

local ESPImage = Instance.new("ImageLabel")
ESPImage.Name = "ESPImage"
ESPImage.Image = "rbxassetid://103402115168960"
ESPImage.ScaleType = Enum.ScaleType.Crop
ESPImage.BackgroundTransparency = 1
ESPImage.Size = UDim2.new(1, 0, 1, 0)
ESPImage.Position = UDim2.new(0, 0, 0, 0)
ESPImage.ZIndex = 10

local ESPOverlay = Instance.new("Frame")
ESPOverlay.Name = "ESPOverlay"
ESPOverlay.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
ESPOverlay.BackgroundTransparency = 0.7
ESPOverlay.Size = UDim2.new(1, 0, 1, 0)
ESPOverlay.Position = UDim2.new(0, 0, 0, 0)
ESPOverlay.ZIndex = 11

ESPImage.Parent = ESPTab
ESPOverlay.Parent = ESPTab

local ESPLayout = Instance.new("UIListLayout")
ESPLayout.Padding = UDim.new(0, 10)
ESPLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ESPLayout.Parent = ESPTab

local FarmTab = Instance.new("Frame")
FarmTab.Name = "FarmTab"
FarmTab.BackgroundTransparency = 1
FarmTab.Size = UDim2.new(1, 0, 0, 250)
FarmTab.Visible = false
FarmTab.ZIndex = 11

local FarmImage = Instance.new("ImageLabel")
FarmImage.Name = "FarmImage"
FarmImage.Image = "rbxassetid://103402115168960"
FarmImage.ScaleType = Enum.ScaleType.Crop
FarmImage.BackgroundTransparency = 1
FarmImage.Size = UDim2.new(1, 0, 1, 0)
FarmImage.Position = UDim2.new(0, 0, 0, 0)
FarmImage.ZIndex = 10

local FarmOverlay = Instance.new("Frame")
FarmOverlay.Name = "FarmOverlay"
FarmOverlay.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
FarmOverlay.BackgroundTransparency = 0.7
FarmOverlay.Size = UDim2.new(1, 0, 1, 0)
FarmOverlay.Position = UDim2.new(0, 0, 0, 0)
FarmOverlay.ZIndex = 11

FarmImage.Parent = FarmTab
FarmOverlay.Parent = FarmTab

local FarmLayout = Instance.new("UIListLayout")
FarmLayout.Padding = UDim.new(0, 10)
FarmLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
FarmLayout.Parent = FarmTab

local SettingsTab = Instance.new("Frame")
SettingsTab.Name = "SettingsTab"
SettingsTab.BackgroundTransparency = 1
SettingsTab.Size = UDim2.new(1, 0, 0, 300)
SettingsTab.Visible = false
SettingsTab.ZIndex = 11

local SettingsImage = Instance.new("ImageLabel")
SettingsImage.Name = "SettingsImage"
SettingsImage.Image = "rbxassetid://103402115168960"
SettingsImage.ScaleType = Enum.ScaleType.Crop
SettingsImage.BackgroundTransparency = 1
SettingsImage.Size = UDim2.new(1, 0, 1, 0)
SettingsImage.Position = UDim2.new(0, 0, 0, 0)
SettingsImage.ZIndex = 10

local SettingsOverlay = Instance.new("Frame")
SettingsOverlay.Name = "SettingsOverlay"
SettingsOverlay.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
SettingsOverlay.BackgroundTransparency = 0.7
SettingsOverlay.Size = UDim2.new(1, 0, 1, 0)
SettingsOverlay.Position = UDim2.new(0, 0, 0, 0)
SettingsOverlay.ZIndex = 11

SettingsImage.Parent = SettingsTab
SettingsOverlay.Parent = SettingsTab

local SettingsLayout = Instance.new("UIListLayout")
SettingsLayout.Padding = UDim.new(0, 10)
SettingsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SettingsLayout.Parent = SettingsTab

ScriptManager.TabContents["Combat"] = CombatTab
ScriptManager.TabContents["ESP"] = ESPTab
ScriptManager.TabContents["Auto Farm"] = FarmTab
ScriptManager.TabContents["Settings"] = SettingsTab

local function CreateButton(text, color, height, icon)
    local button = Instance.new("TextButton")
    button.Text = icon and (icon .. " " .. text) or text
    button.Font = Enum.Font.GothamBlack
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = color
    button.AutoButtonColor = true
    button.Size = UDim2.new(0.95, 0, 0, height or 45)
    button.TextSize = 15
    button.ZIndex = 13
    
    local ButtonImage = Instance.new("ImageLabel")
    ButtonImage.Name = "ButtonImage"
    ButtonImage.Image = "rbxassetid://103402115168960"
    ButtonImage.ScaleType = Enum.ScaleType.Crop
    ButtonImage.BackgroundTransparency = 1
    ButtonImage.Size = UDim2.new(1, 0, 1, 0)
    ButtonImage.Position = UDim2.new(0, 0, 0, 0)
    ButtonImage.ZIndex = 12
    
    local ButtonOverlay = Instance.new("Frame")
    ButtonOverlay.Name = "ButtonOverlay"
    ButtonOverlay.BackgroundColor3 = color
    ButtonOverlay.BackgroundTransparency = 0.3
    ButtonOverlay.Size = UDim2.new(1, 0, 1, 0)
    ButtonOverlay.Position = UDim2.new(0, 0, 0, 0)
    ButtonOverlay.ZIndex = 13
    
    ButtonImage.Parent = button
    ButtonOverlay.Parent = button
    
    local ButtonGlow = Instance.new("UIStroke")
    ButtonGlow.Color = Color3.fromRGB(255, 255, 255)
    ButtonGlow.Thickness = 1.5
    ButtonGlow.Transparency = 0.7
    ButtonGlow.Parent = button
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.08, 0)
    corner.Parent = button
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.2,
            TextColor3 = Color3.fromRGB(255, 255, 200)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end)
    
    return button
end

local AutoShotButton = CreateButton("AUTO SHOT: OFF", Color3.fromRGB(255, 50, 50), 50, "🎯")
local BringAllButton = CreateButton("BRING ALL", Color3.fromRGB(200, 50, 50), 45, "🔪")
local BringMurdererButton = CreateButton("BRING MURDERER", Color3.fromRGB(150, 30, 30), 45, "🗡️")
local BringSheriffButton = CreateButton("BRING SHERIFF", Color3.fromRGB(50, 100, 200), 45, "👮")
local TeleGunButton = CreateButton("TELEPORT TO GUN", Color3.fromRGB(255, 165, 0), 50, "🚀")
local LoopButton = CreateButton("LOOP BRING: OFF", Color3.fromRGB(80, 80, 100), 40, "🔄")

AutoShotButton.Parent = CombatTab
BringAllButton.Parent = CombatTab
BringMurdererButton.Parent = CombatTab
BringSheriffButton.Parent = CombatTab
TeleGunButton.Parent = CombatTab
LoopButton.Parent = CombatTab

local ESPButton = CreateButton("ESP PLAYERS: OFF", Color3.fromRGB(50, 150, 50), 50, "👁️")
local GunESPButton = CreateButton("ESP GUN: OFF", Color3.fromRGB(255, 215, 0), 50, "🔫")

ESPButton.Parent = ESPTab
GunESPButton.Parent = ESPTab

local AutoFarmButton = CreateButton("AUTO FARM: OFF", Color3.fromRGB(50, 200, 100), 60, "🌾")
local NoClipButton = CreateButton("NOCLIP: OFF", Color3.fromRGB(100, 150, 255), 50, "🚀")

AutoFarmButton.Parent = FarmTab
NoClipButton.Parent = FarmTab

local ReduceLagButton = CreateButton("REDUCE LAG: OFF", Color3.fromRGB(100, 100, 200), 50, "⚡")
local MovableGUIButton = CreateButton("GUI MOVABLE: ON", Color3.fromRGB(150, 100, 200), 50, "🔄")

ReduceLagButton.Parent = SettingsTab
MovableGUIButton.Parent = SettingsTab

local CounterFrame = Instance.new("Frame")
CounterFrame.Name = "CounterFrame"
CounterFrame.BackgroundColor3 = Color3.fromRGB(35, 25, 30)
CounterFrame.Size = UDim2.new(1, -20, 0, 75)
CounterFrame.Position = UDim2.new(0, 10, 1, -85)
CounterFrame.ZIndex = 12

local CounterImage = Instance.new("ImageLabel")
CounterImage.Name = "CounterImage"
CounterImage.Image = "rbxassetid://103402115168960"
CounterImage.ScaleType = Enum.ScaleType.Crop
CounterImage.BackgroundTransparency = 1
CounterImage.Size = UDim2.new(1, 0, 1, 0)
CounterImage.Position = UDim2.new(0, 0, 0, 0)
CounterImage.ZIndex = 11

local CounterOverlay = Instance.new("Frame")
CounterOverlay.Name = "CounterOverlay"
CounterOverlay.BackgroundColor3 = Color3.fromRGB(35, 25, 30)
CounterOverlay.BackgroundTransparency = 0.5
CounterOverlay.Size = UDim2.new(1, 0, 1, 0)
CounterOverlay.Position = UDim2.new(0, 0, 0, 0)
CounterOverlay.ZIndex = 12

CounterImage.Parent = CounterFrame
CounterOverlay.Parent = CounterFrame

local CounterGlow = Instance.new("UIStroke")
CounterGlow.Color = Color3.fromRGB(100, 50, 80)
CounterGlow.Thickness = 1
CounterGlow.Parent = CounterFrame

local CounterCorner = Instance.new("UICorner")
CounterCorner.CornerRadius = UDim.new(0.02, 0)
CounterCorner.Parent = CounterFrame

local PlayerCounter = Instance.new("TextLabel")
PlayerCounter.Name = "PlayerCounter"
PlayerCounter.BackgroundTransparency = 1
PlayerCounter.Text = "👥 Players: 0/0"
PlayerCounter.Font = Enum.Font.GothamSemibold
PlayerCounter.TextColor3 = Color3.fromRGB(200, 150, 150)
PlayerCounter.TextSize = 16
PlayerCounter.Size = UDim2.new(1, -20, 0.5, 0)
PlayerCounter.Position = UDim2.new(0, 10, 0, 5)
PlayerCounter.TextXAlignment = Enum.TextXAlignment.Center
PlayerCounter.ZIndex = 13

local PlayerCounterGlow = Instance.new("UIStroke")
PlayerCounterGlow.Color = Color3.fromRGB(255, 150, 150)
PlayerCounterGlow.Thickness = 1
PlayerCounterGlow.Transparency = 0.5
PlayerCounterGlow.Parent = PlayerCounter

PlayerCounter.Parent = CounterFrame

local RoleCounter = Instance.new("TextLabel")
RoleCounter.Name = "RoleCounter"
RoleCounter.BackgroundTransparency = 1
RoleCounter.Text = "⚔️ Roles: Loading..."
RoleCounter.Font = Enum.Font.Gotham
RoleCounter.TextSize = 14
RoleCounter.TextColor3 = Color3.fromRGB(180, 120, 120)
RoleCounter.Size = UDim2.new(1, -20, 0.5, 0)
RoleCounter.Position = UDim2.new(0, 10, 0.5, 0)
RoleCounter.TextXAlignment = Enum.TextXAlignment.Center
RoleCounter.ZIndex = 13
RoleCounter.Parent = CounterFrame

Header.Parent = MainFrame
TabsFrame.Parent = MainFrame

CombatTab.Parent = ContentFrame
ESPTab.Parent = ContentFrame
FarmTab.Parent = ContentFrame
SettingsTab.Parent = ContentFrame

ContentFrame.Parent = MainFrame
CounterFrame.Parent = MainFrame
MainFrame.Parent = ScreenGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Text = "⚡"
ToggleButton.Font = Enum.Font.GothamBlack
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
ToggleButton.AutoButtonColor = true
ToggleButton.Visible = true
ToggleButton.Active = true
ToggleButton.Size = UDim2.new(0, 65, 0, 65)
ToggleButton.Position = UDim2.new(0.02, 0, 0.95, -65)
ToggleButton.TextSize = 32
ToggleButton.ZIndex = 100

local ToggleImage = Instance.new("ImageLabel")
ToggleImage.Name = "ToggleImage"
ToggleImage.Image = "rbxassetid://103402115168960"
ToggleImage.ScaleType = Enum.ScaleType.Crop
ToggleImage.BackgroundTransparency = 1
ToggleImage.Size = UDim2.new(1, 0, 1, 0)
ToggleImage.Position = UDim2.new(0, 0, 0, 0)
ToggleImage.ZIndex = 99

local ToggleOverlay = Instance.new("Frame")
ToggleOverlay.Name = "ToggleOverlay"
ToggleOverlay.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
ToggleOverlay.BackgroundTransparency = 0.3
ToggleOverlay.Size = UDim2.new(1, 0, 1, 0)
ToggleOverlay.Position = UDim2.new(0, 0, 0, 0)
ToggleOverlay.ZIndex = 100

ToggleImage.Parent = ToggleButton
ToggleOverlay.Parent = ToggleButton

local ToggleGlow = Instance.new("UIStroke")
ToggleGlow.Color = Color3.fromRGB(255, 255, 255)
ToggleGlow.Thickness = 2
ToggleGlow.Transparency = 0.3
ToggleGlow.Parent = ToggleButton

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0.5, 0)
ToggleCorner.Parent = ToggleButton

spawn(function()
    while true do
        TweenService:Create(ToggleButton, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, true), {
            BackgroundTransparency = 0.2,
            TextTransparency = 0.1
        }):Play()
        task.wait(1.6)
    end
end)

ToggleButton.Parent = ScreenGui

local KeyUIFrame = Instance.new("Frame")
KeyUIFrame.Name = "KeyUIFrame"
KeyUIFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
KeyUIFrame.BackgroundTransparency = 0.1
KeyUIFrame.Size = UDim2.new(0, 400, 0, 250)
KeyUIFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
KeyUIFrame.Visible = true
KeyUIFrame.ZIndex = 200

local KeyImage = Instance.new("ImageLabel")
KeyImage.Name = "KeyImage"
KeyImage.Image = "rbxassetid://103402115168960"
KeyImage.ScaleType = Enum.ScaleType.Crop
KeyImage.BackgroundTransparency = 1
KeyImage.Size = UDim2.new(1, 0, 1, 0)
KeyImage.Position = UDim2.new(0, 0, 0, 0)
KeyImage.ZIndex = 199

local KeyOverlay = Instance.new("Frame")
KeyOverlay.Name = "KeyOverlay"
KeyOverlay.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
KeyOverlay.BackgroundTransparency = 0.4
KeyOverlay.Size = UDim2.new(1, 0, 1, 0)
KeyOverlay.Position = UDim2.new(0, 0, 0, 0)
KeyOverlay.ZIndex = 200

KeyImage.Parent = KeyUIFrame
KeyOverlay.Parent = KeyUIFrame

local KeyBorder = Instance.new("UIStroke")
KeyBorder.Color = Color3.fromRGB(150, 50, 100)
KeyBorder.Thickness = 2
KeyBorder.Parent = KeyUIFrame

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0.03, 0)
KeyCorner.Parent = KeyUIFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Name = "KeyTitle"
KeyTitle.Text = "🔑 NHẬP KEY ĐỂ TIẾP TỤC"
KeyTitle.Font = Enum.Font.GothamBlack
KeyTitle.TextColor3 = Color3.fromRGB(255, 200, 200)
KeyTitle.TextSize = 22
KeyTitle.BackgroundTransparency = 1
KeyTitle.Size = UDim2.new(1, -40, 0, 50)
KeyTitle.Position = UDim2.new(0, 20, 0, 10)
KeyTitle.TextXAlignment = Enum.TextXAlignment.Center
KeyTitle.ZIndex = 201

local KeyTitleGlow = Instance.new("UIStroke")
KeyTitleGlow.Color = Color3.fromRGB(255, 100, 100)
KeyTitleGlow.Thickness = 2
KeyTitleGlow.Transparency = 0.5
KeyTitleGlow.Parent = KeyTitle

KeyTitle.Parent = KeyUIFrame

local KeyInputBox = Instance.new("TextBox")
KeyInputBox.Name = "KeyInputBox"
KeyInputBox.PlaceholderText = "Nhập key vào đây..."
KeyInputBox.Text = ""
KeyInputBox.Font = Enum.Font.Gotham
KeyInputBox.TextSize = 16
KeyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInputBox.BackgroundColor3 = Color3.fromRGB(30, 20, 30)
KeyInputBox.Size = UDim2.new(1, -80, 0, 45)
KeyInputBox.Position = UDim2.new(0, 40, 0, 80)
KeyInputBox.ZIndex = 201

local KeyInputGlow = Instance.new("UIStroke")
KeyInputGlow.Color = Color3.fromRGB(100, 100, 255)
KeyInputGlow.Thickness = 1
KeyInputGlow.Parent = KeyInputBox

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0.05, 0)
KeyInputCorner.Parent = KeyInputBox

KeyInputBox.Parent = KeyUIFrame

local KeySubmitButton = Instance.new("TextButton")
KeySubmitButton.Name = "KeySubmitButton"
KeySubmitButton.Text = "XÁC NHẬN"
KeySubmitButton.Font = Enum.Font.GothamBold
KeySubmitButton.TextSize = 18
KeySubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeySubmitButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
KeySubmitButton.Size = UDim2.new(0.6, 0, 0, 45)
KeySubmitButton.Position = UDim2.new(0.2, 0, 0, 150)
KeySubmitButton.ZIndex = 201

local KeySubmitGlow = Instance.new("UIStroke")
KeySubmitGlow.Color = Color3.fromRGB(255, 255, 255)
KeySubmitGlow.Thickness = 1.5
KeySubmitGlow.Transparency = 0.5
KeySubmitGlow.Parent = KeySubmitButton

local KeySubmitCorner = Instance.new("UICorner")
KeySubmitCorner.CornerRadius = UDim.new(0.08, 0)
KeySubmitCorner.Parent = KeySubmitButton

KeySubmitButton.Parent = KeyUIFrame

local KeyStatusLabel = Instance.new("TextLabel")
KeyStatusLabel.Name = "KeyStatusLabel"
KeyStatusLabel.Text = "Còn 3 lần thử"
KeyStatusLabel.Font = Enum.Font.Gotham
KeyStatusLabel.TextSize = 14
KeyStatusLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
KeyStatusLabel.BackgroundTransparency = 1
KeyStatusLabel.Size = UDim2.new(1, -40, 0, 30)
KeyStatusLabel.Position = UDim2.new(0, 20, 1, -40)
KeyStatusLabel.TextXAlignment = Enum.TextXAlignment.Center
KeyStatusLabel.ZIndex = 201
KeyStatusLabel.Parent = KeyUIFrame

KeyUIFrame.Parent = ScreenGui

for tabName, button in pairs(ScriptManager.TabButtons) do
    button.MouseButton1Click:Connect(function()
        ScriptManager:SwitchTab(tabName)
    end)
end

ToggleButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then
        warn("⚠️ Vui lòng nhập key trước!")
        return
    end
    
    ScriptManager.IsMenuOpen = not ScriptManager.IsMenuOpen
    MainFrame.Visible = ScriptManager.IsMenuOpen
    
    if ScriptManager.IsMenuOpen then
        ToggleButton.Text = "❌"
        local playerText, roleText = ScriptManager:UpdatePlayerCounter()
        PlayerCounter.Text = playerText
        RoleCounter.Text = roleText
    else
        ToggleButton.Text = "⚡"
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScriptManager.IsMenuOpen = false
    MainFrame.Visible = false
    ToggleButton.Text = "⚡"
end)

KeySubmitButton.MouseButton1Click:Connect(function()
    local inputKey = KeyInputBox.Text
    if inputKey and inputKey ~= "" then
        if ScriptManager.KeySystem:CheckKey(inputKey) then
            KeyUIFrame.Visible = false
            KeyInputBox.Text = ""
            ToggleButton.Visible = true
            ScriptManager.KeySystem:ProtectKey()
        else
            KeyStatusLabel.Text = "Key sai! Còn " .. (ScriptManager.KeySystem.MaxAttempts - ScriptManager.KeySystem.KeyAttempts) .. " lần thử"
            KeyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end
end)

KeyInputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        KeySubmitButton:Activate()
    end
end)

AutoShotButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager:ToggleAutoShot()
    AutoShotButton.Text = ScriptManager.IsAutoShot and "🎯 AUTO SHOT: ON" or "🎯 AUTO SHOT: OFF"
    AutoShotButton.BackgroundColor3 = ScriptManager.IsAutoShot and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 50, 50)
end)

BringAllButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    local success, failed = ScriptManager:BringAllPlayers()
    print(string.format("✅ Brought: %d | ❌ Failed: %d", success, failed))
end)

BringMurdererButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    if ScriptManager:BringMurderer() then
        print("✅ Murderer brought!")
    else
        print("❌ No murderer found")
    end
end)

BringSheriffButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    if ScriptManager:BringSheriff() then
        print("✅ Sheriff brought!")
    else
        print("❌ No sheriff found")
    end
end)

TeleGunButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    if ScriptManager:TeleportToNearestGun() then
        print("✅ Teleported to gun!")
    else
        print("❌ No gun found")
    end
end)

LoopButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager.IsLooping = not ScriptManager.IsLooping
    
    if ScriptManager.IsLooping then
        LoopButton.Text = "🔄 LOOP BRING: ON"
        LoopButton.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        
        ScriptManager.LoopConnection = RunService.Heartbeat:Connect(function()
            if not ScriptManager.IsBringing then
                ScriptManager:BringAllPlayers()
                task.wait(3)
            end
        end)
    else
        LoopButton.Text = "🔄 LOOP BRING: OFF"
        LoopButton.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
        
        if ScriptManager.LoopConnection then
            ScriptManager.LoopConnection:Disconnect()
            ScriptManager.LoopConnection = nil
        end
    end
end)

ESPButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager:ToggleESP()
    ESPButton.Text = ScriptManager.ESPEnabled and "👁️ ESP PLAYERS: ON" or "👁️ ESP PLAYERS: OFF"
    ESPButton.BackgroundColor3 = ScriptManager.ESPEnabled and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(50, 150, 50)
end)

GunESPButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager:ToggleGunESP()
    GunESPButton.Text = ScriptManager.GunESPEnabled and "🔫 ESP GUN: ON" or "🔫 ESP GUN: OFF"
    GunESPButton.BackgroundColor3 = ScriptManager.GunESPEnabled and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(255, 215, 0)
end)

AutoFarmButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager:ToggleAutoFarm()
    AutoFarmButton.Text = ScriptManager.IsFarming and "🌾 AUTO FARM: ON" or "🌾 AUTO FARM: OFF"
    AutoFarmButton.BackgroundColor3 = ScriptManager.IsFarming and Color3.fromRGB(50, 255, 100) or Color3.fromRGB(50, 200, 100)
end)

NoClipButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager:ToggleNoClip()
    NoClipButton.Text = ScriptManager.NoClipEnabled and "🚀 NOCLIP: ON" or "🚀 NOCLIP: OFF"
    NoClipButton.BackgroundColor3 = ScriptManager.NoClipEnabled and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(100, 150, 255)
end)

ReduceLagButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager:ToggleReduceLag()
    ReduceLagButton.Text = ScriptManager.IsReduceLag and "⚡ REDUCE LAG: ON" or "⚡ REDUCE LAG: OFF"
    ReduceLagButton.BackgroundColor3 = ScriptManager.IsReduceLag and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(100, 100, 200)
end)

MovableGUIButton.MouseButton1Click:Connect(function()
    if not ScriptManager.KeySystem.IsKeyValid then return end
    ScriptManager.IsGUIMovable = not ScriptManager.IsGUIMovable
    MainFrame.Draggable = ScriptManager.IsGUIMovable
    
    MovableGUIButton.Text = ScriptManager.IsGUIMovable and "🔄 GUI MOVABLE: ON" or "🔄 GUI MOVABLE: OFF"
    MovableGUIButton.BackgroundColor3 = ScriptManager.IsGUIMovable and Color3.fromRGB(150, 100, 255) or Color3.fromRGB(150, 100, 200)
end)

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ScriptManager.IsDragging = true
        ScriptManager.DragStart = input.Position
        ScriptManager.DragStartPosition = MainFrame.Position
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and ScriptManager.IsDragging then
        local delta = input.Position - ScriptManager.DragStart
        MainFrame.Position = UDim2.new(
            ScriptManager.DragStartPosition.X.Scale,
            ScriptManager.DragStartPosition.X.Offset + delta.X,
            ScriptManager.DragStartPosition.Y.Scale,
            ScriptManager.DragStartPosition.Y.Offset + delta.Y
        )
    end
end)

Header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ScriptManager.IsDragging = false
    end
end)

ToggleButton.Visible = false
MainFrame.Visible = false

task.spawn(function()
    task.wait(3)
    
    ScriptManager:SetupAutoESPUpdates()
    
    local playerText, roleText = ScriptManager:UpdatePlayerCounter()
    PlayerCounter.Text = playerText
    RoleCounter.Text = roleText
    
    print("========================================")
    print("✅ Ultimate MM2 Script v2.1 Loaded!")
    print("🔑 Key System: Đang yêu cầu key...")
    print("🎨 GUI: Đã thêm decal background")
    print("========================================")
end)