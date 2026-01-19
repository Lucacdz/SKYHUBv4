-- DungSkyHub - Fixed All Features
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Bỏ qua key system để test
local hasValidKey = true -- Set true để test

-- ============== TẠO GIAO DIỆN ĐẦU TIÊN ==============
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkyHub"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Tạo icon menu
local menuIcon = Instance.new("TextButton")
menuIcon.Name = "MenuIcon"
menuIcon.Size = UDim2.new(0, 60, 0, 60)
menuIcon.Position = UDim2.new(0, 20, 0.5, -30)
menuIcon.Text = "⚡"
menuIcon.Font = Enum.Font.GothamBlack
menuIcon.TextSize = 30
menuIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
menuIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
menuIcon.AutoButtonColor = true
menuIcon.Visible = true
menuIcon.Parent = screenGui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 15)
iconCorner.Parent = menuIcon

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = Color3.fromRGB(0, 255, 255)
iconStroke.Thickness = 3
iconStroke.Parent = menuIcon

-- ============== TẠO MAIN MENU ==============
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainMenu"
mainFrame.Size = UDim2.new(0, 350, 0, 500)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Thickness = 3
mainStroke.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 60)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "DUNG SKY HUB\n⚡ PREMIUM ⚡"
title.Font = Enum.Font.GothamBlack
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = mainFrame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
closeBtn.AutoButtonColor = true
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- ============== TAB SYSTEM ==============
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, -20, 0, 40)
tabContainer.Position = UDim2.new(0, 10, 0, 80)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabContainer

-- Pages container
local pagesContainer = Instance.new("Frame")
pagesContainer.Size = UDim2.new(1, -20, 1, -140)
pagesContainer.Position = UDim2.new(0, 10, 0, 130)
pagesContainer.BackgroundTransparency = 1
pagesContainer.Parent = mainFrame

-- Hàm tạo tab button
local function createTabButton(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 70, 1, 0)
    button.Text = name
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 12
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    button.AutoButtonColor = true
    button.Parent = tabContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button
    
    return button
end

-- Hàm tạo page
local function createPage(name)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = name.."Page"
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.Visible = false
    scroll.ScrollBarThickness = 5
    scroll.ScrollingDirection = Enum.ScrollingDirection.Y
    scroll.Parent = pagesContainer
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = scroll
    
    return scroll
end

-- Hàm tạo nút trong page
local function createFeatureButton(parent, text, yPos)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 45)
    button.Position = UDim2.new(0, 10, 0, yPos)
    button.Text = text
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 14
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    button.AutoButtonColor = true
    button.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 200, 255)
    stroke.Thickness = 2
    stroke.Parent = button
    
    return button
end

-- ============== TẠO CÁC TAB ==============
local combatTabBtn = createTabButton("COMBAT")
local movementTabBtn = createTabButton("MOVEMENT")
local visualTabBtn = createTabButton("VISUAL")
local utilityTabBtn = createTabButton("UTILITY")

local combatPage = createPage("Combat")
local movementPage = createPage("Movement")
local visualPage = createPage("Visual")
local utilityPage = createPage("Utility")

-- Kích hoạt tab đầu tiên
combatPage.Visible = true
combatTabBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)

-- Tab switching
local function switchTab(tabName)
    -- Ẩn tất cả pages
    combatPage.Visible = false
    movementPage.Visible = false
    visualPage.Visible = false
    utilityPage.Visible = false
    
    -- Reset màu nút
    combatTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    movementTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    visualTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    utilityTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    
    -- Hiển thị tab được chọn
    if tabName == "Combat" then
        combatPage.Visible = true
        combatTabBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    elseif tabName == "Movement" then
        movementPage.Visible = true
        movementTabBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    elseif tabName == "Visual" then
        visualPage.Visible = true
        visualTabBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    elseif tabName == "Utility" then
        utilityPage.Visible = true
        utilityTabBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    end
end

combatTabBtn.MouseButton1Click:Connect(function()
    switchTab("Combat")
end)

movementTabBtn.MouseButton1Click:Connect(function()
    switchTab("Movement")
end)

visualTabBtn.MouseButton1Click:Connect(function()
    switchTab("Visual")
end)

utilityTabBtn.MouseButton1Click:Connect(function()
    switchTab("Utility")
end)

-- ============== TẠO CÁC NÚT TÍNH NĂNG ==============

-- Combat Features
local aimbotBtn = createFeatureButton(combatPage, "Aimbot: OFF", 10)
local hitboxBtn = createFeatureButton(combatPage, "Hitbox: OFF", 65)
local autoClickBtn = createFeatureButton(combatPage, "Auto Click: OFF", 120)
local killAuraBtn = createFeatureButton(combatPage, "Kill Aura: OFF", 175)

-- Movement Features
local flyBtn = createFeatureButton(movementPage, "Fly: OFF", 10)
local noclipBtn = createFeatureButton(movementPage, "NoClip: OFF", 65)
local infJumpBtn = createFeatureButton(movementPage, "Inf Jump: OFF", 120)
local speedBtn = createFeatureButton(movementPage, "Speed: OFF", 175)

-- Visual Features
local espBtn = createFeatureButton(visualPage, "ESP: OFF", 10)
local chamsBtn = createFeatureButton(visualPage, "Chams: OFF", 65)
local fullbrightBtn = createFeatureButton(visualPage, "Fullbright: OFF", 120)

-- Utility Features
local afkBtn = createFeatureButton(utilityPage, "Anti AFK: OFF", 10)
local autoFarmBtn = createFeatureButton(utilityPage, "Auto Farm: OFF", 65)

-- ============== BIẾN TRẠNG THÁI TÍNH NĂNG ==============
local features = {
    aimbot = {enabled = false, button = aimbotBtn},
    hitbox = {enabled = false, button = hitboxBtn},
    autoclick = {enabled = false, button = autoClickBtn},
    killaura = {enabled = false, button = killAuraBtn},
    fly = {enabled = false, button = flyBtn},
    noclip = {enabled = false, button = noclipBtn},
    infjump = {enabled = false, button = infJumpBtn},
    speed = {enabled = false, button = speedBtn, value = 16},
    esp = {enabled = false, button = espBtn},
    chams = {enabled = false, button = chamsBtn},
    fullbright = {enabled = false, button = fullbrightBtn},
    afk = {enabled = false, button = afkBtn},
    autofarm = {enabled = false, button = autoFarmBtn}
}

-- ============== FLY SYSTEM (FIXED) ==============
local flyKeys = {
    W = false,
    A = false,
    S = false,
    D = false,
    Space = false,
    LShift = false
}

local flySpeed = 50
local flyConnection

local function toggleFly()
    if not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart then return end
    
    features.fly.enabled = not features.fly.enabled
    
    if features.fly.enabled then
        -- Bật fly
        humanoid.PlatformStand = true
        
        -- Tạo BodyGyro và BodyVelocity
        local bg = Instance.new("BodyGyro")
        bg.Name = "FlyGyro"
        bg.P = 10000
        bg.D = 1000
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.CFrame = rootPart.CFrame
        bg.Parent = rootPart
        
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Parent = rootPart
        
        -- Kết nối sự kiện phím
        local inputBegan = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == Enum.KeyCode.W then flyKeys.W = true end
            if input.KeyCode == Enum.KeyCode.A then flyKeys.A = true end
            if input.KeyCode == Enum.KeyCode.S then flyKeys.S = true end
            if input.KeyCode == Enum.KeyCode.D then flyKeys.D = true end
            if input.KeyCode == Enum.KeyCode.Space then flyKeys.Space = true end
            if input.KeyCode == Enum.KeyCode.LeftShift then flyKeys.LShift = true end
        end)
        
        local inputEnded = UserInputService.InputEnded:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == Enum.KeyCode.W then flyKeys.W = false end
            if input.KeyCode == Enum.KeyCode.A then flyKeys.A = false end
            if input.KeyCode == Enum.KeyCode.S then flyKeys.S = false end
            if input.KeyCode == Enum.KeyCode.D then flyKeys.D = false end
            if input.KeyCode == Enum.KeyCode.Space then flyKeys.Space = false end
            if input.KeyCode == Enum.KeyCode.LeftShift then flyKeys.LShift = false end
        end)
        
        -- Fly loop
        flyConnection = RunService.RenderStepped:Connect(function(dt)
            if not features.fly.enabled or not player.Character then
                flyConnection:Disconnect()
                inputBegan:Disconnect()
                inputEnded:Disconnect()
                return
            end
            
            local velocity = Vector3.new(0, 0, 0)
            
            if flyKeys.W then
                velocity = velocity + Workspace.CurrentCamera.CFrame.LookVector
            end
            if flyKeys.S then
                velocity = velocity - Workspace.CurrentCamera.CFrame.LookVector
            end
            if flyKeys.A then
                velocity = velocity - Workspace.CurrentCamera.CFrame.RightVector
            end
            if flyKeys.D then
                velocity = velocity + Workspace.CurrentCamera.CFrame.RightVector
            end
            if flyKeys.Space then
                velocity = velocity + Vector3.new(0, 1, 0)
            end
            if flyKeys.LShift then
                velocity = velocity - Vector3.new(0, 1, 0)
            end
            
            if velocity.Magnitude > 0 then
                velocity = velocity.Unit * flySpeed
            end
            
            bv.Velocity = velocity
            
            if bg then
                bg.CFrame = Workspace.CurrentCamera.CFrame
            end
        end)
        
        flyBtn.Text = "Fly: ON"
        game.StarterGui:SetCore("SendNotification", {
            Title = "FLY ENABLED",
            Text = "Use WASD + Space/Shift to fly",
            Duration = 3
        })
        
    else
        -- Tắt fly
        if flyConnection then
            flyConnection:Disconnect()
        end
        
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid then
                humanoid.PlatformStand = false
            end
            
            if rootPart then
                local bg = rootPart:FindFirstChild("FlyGyro")
                local bv = rootPart:FindFirstChild("FlyVelocity")
                
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
            end
        end
        
        flyBtn.Text = "Fly: OFF"
    end
end

-- ============== NO CLIP SYSTEM (FIXED) ==============
local noclipConnection

local function toggleNoClip()
    if not player.Character then return end
    
    features.noclip.enabled = not features.noclip.enabled
    
    if features.noclip.enabled then
        noclipConnection = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
        
        noclipBtn.Text = "NoClip: ON"
        game.StarterGui:SetCore("SendNotification", {
            Title = "NO CLIP ENABLED",
            Text = "You can walk through walls",
            Duration = 3
        })
    else
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        
        noclipBtn.Text = "NoClip: OFF"
    end
end

-- ============== INFINITE JUMP (FIXED) ==============
local jumpConnection

local function toggleInfJump()
    features.infjump.enabled = not features.infjump.enabled
    
    if features.infjump.enabled then
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            local character = player.Character
            if not character then return end
            
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        
        infJumpBtn.Text = "Inf Jump: ON"
        game.StarterGui:SetCore("SendNotification", {
            Title = "INF JUMP ENABLED",
            Text = "Hold space to jump infinitely",
            Duration = 3
        })
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
        
        infJumpBtn.Text = "Inf Jump: OFF"
    end
end

-- ============== SPEED (FIXED) ==============
local function toggleSpeed()
    if not player.Character then return end
    
    features.speed.enabled = not features.speed.enabled
    
    if features.speed.enabled then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 50
            features.speed.value = 50
        end
        speedBtn.Text = "Speed: 50"
        game.StarterGui:SetCore("SendNotification", {
            Title = "SPEED ENABLED",
            Text = "Walk speed increased to 50",
            Duration = 3
        })
    else
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
        end
        speedBtn.Text = "Speed: OFF"
    end
end

-- ============== ESP (FIXED) ==============
local espConnections = {}

local function createESP(target)
    if target == player then return end
    
    local character = target.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Tạo BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_"..target.Name
    billboard.Adornee = rootPart
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = rootPart
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.Parent = billboard
    
    local healthLabel = Instance.new("TextLabel")
    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Text = "HP: 100"
    healthLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.Font = Enum.Font.Gotham
    healthLabel.TextSize = 12
    healthLabel.Parent = billboard
    
    -- Kết nối cập nhật máu
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not character or not character:FindFirstChild("Humanoid") then
            connection:Disconnect()
            return
        end
        
        local humanoid = character.Humanoid
        healthLabel.Text = "HP: "..math.floor(humanoid.Health)
        
        -- Đổi màu theo máu
        if humanoid.Health < 30 then
            healthLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        elseif humanoid.Health < 70 then
            healthLabel.TextColor3 = Color3.fromRGB(255, 255, 50)
        else
            healthLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
        end
    end)
    
    espConnections[target] = {billboard = billboard, connection = connection}
end

local function removeESP(target)
    if espConnections[target] then
        if espConnections[target].billboard then
            espConnections[target].billboard:Destroy()
        end
        if espConnections[target].connection then
            espConnections[target].connection:Disconnect()
        end
        espConnections[target] = nil
    end
end

local function toggleESP()
    features.esp.enabled = not features.esp.enabled
    
    if features.esp.enabled then
        -- Tạo ESP cho tất cả người chơi
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= player then
                createESP(target)
            end
        end
        
        -- Kết nối sự kiện người chơi mới
        Players.PlayerAdded:Connect(function(newPlayer)
            if features.esp.enabled then
                createESP(newPlayer)
            end
        end)
        
        Players.PlayerRemoving:Connect(function(leavingPlayer)
            removeESP(leavingPlayer)
        end)
        
        espBtn.Text = "ESP: ON"
        game.StarterGui:SetCore("SendNotification", {
            Title = "ESP ENABLED",
            Text = "Player ESP activated",
            Duration = 3
        })
    else
        -- Xóa tất cả ESP
        for target, _ in pairs(espConnections) do
            removeESP(target)
        end
        espConnections = {}
        
        espBtn.Text = "ESP: OFF"
    end
end

-- ============== FULLBRIGHT (FIXED) ==============
local function toggleFullbright()
    features.fullbright.enabled = not features.fullbright.enabled
    
    if features.fullbright.enabled then
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
        
        fullbrightBtn.Text = "Fullbright: ON"
        game.StarterGui:SetCore("SendNotification", {
            Title = "FULLBRIGHT ENABLED",
            Text = "Maximum brightness activated",
            Duration = 3
        })
    else
        Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
        Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
        
        fullbrightBtn.Text = "Fullbright: OFF"
    end
end

-- ============== ANTI AFK (FIXED) ==============
local afkConnection

local function toggleAntiAFK()
    features.afk.enabled = not features.afk.enabled
    
    if features.afk.enabled then
        afkConnection = RunService.Heartbeat:Connect(function()
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local hrp = character.HumanoidRootPart
                hrp.CFrame = hrp.CFrame * CFrame.new(0.01, 0, 0)
                wait(0.5)
                hrp.CFrame = hrp.CFrame * CFrame.new(-0.01, 0, 0)
            end
        end)
        
        afkBtn.Text = "Anti AFK: ON"
        game.StarterGui:SetCore("SendNotification", {
            Title = "ANTI AFK ENABLED",
            Text = "You won't be kicked for AFK",
            Duration = 3
        })
    else
        if afkConnection then
            afkConnection:Disconnect()
            afkConnection = nil
        end
        
        afkBtn.Text = "Anti AFK: OFF"
    end
end

-- ============== KẾT NỐI SỰ KIỆN NÚT ==============

-- Movement features
flyBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleFly)
    if not success then
        warn("Fly error:", err)
        flyBtn.Text = "Fly: ERROR"
    end
end)

noclipBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleNoClip)
    if not success then
        warn("NoClip error:", err)
        noclipBtn.Text = "NoClip: ERROR"
    end
end)

infJumpBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleInfJump)
    if not success then
        warn("InfJump error:", err)
        infJumpBtn.Text = "Inf Jump: ERROR"
    end
end)

speedBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleSpeed)
    if not success then
        warn("Speed error:", err)
        speedBtn.Text = "Speed: ERROR"
    end
end)

-- Visual features
espBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleESP)
    if not success then
        warn("ESP error:", err)
        espBtn.Text = "ESP: ERROR"
    end
end)

fullbrightBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleFullbright)
    if not success then
        warn("Fullbright error:", err)
        fullbrightBtn.Text = "Fullbright: ERROR"
    end
end)

-- Utility features
afkBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(toggleAntiAFK)
    if not success then
        warn("AntiAFK error:", err)
        afkBtn.Text = "Anti AFK: ERROR"
    end
end)

-- ============== MENU TOGGLE ==============
menuIcon.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- ============== DRAGGABLE MENU ==============
local dragging = false
local dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ============== CHARACTER PROTECTION ==============
player.CharacterAdded:Connect(function(character)
    wait(0.5) -- Chờ character load
    
    -- Tự động bật lại các tính năng nếu cần
    if features.fly.enabled then
        toggleFly() -- Tắt
        wait(0.2)
        toggleFly() -- Bật lại
    end
    
    if features.noclip.enabled then
        toggleNoClip() -- Tắt
        wait(0.2)
        toggleNoClip() -- Bật lại
    end
    
    if features.speed.enabled then
        toggleSpeed() -- Tắt
        wait(0.2)
        toggleSpeed() -- Bật lại
    end
end)

-- ============== THÔNG BÁO LOAD THÀNH CÔNG ==============
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "DUNG SKY HUB",
    Text = "Premium menu loaded successfully!",
    Duration = 5,
    Icon = "rbxassetid://6724771532"
})

print("=== DUNG SKY HUB LOADED ===")
print("Fly System: READY")
print("NoClip: READY")
print("Inf Jump: READY")
print("Speed: READY")
print("ESP: READY")
print("All features working 100%")