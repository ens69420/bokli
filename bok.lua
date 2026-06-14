local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2_Ultra_V19"
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = false
Main.Parent = ScreenGui

local KeySystem = Instance.new("Frame")
KeySystem.Name = "KeySystem"
KeySystem.Size = UDim2.new(0, 300, 0, 200)
KeySystem.Position = UDim2.new(0.5, -150, 0.5, -100)
KeySystem.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeySystem.BorderSizePixel = 0
KeySystem.Active = true
KeySystem.Draggable = true
KeySystem.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeySystem

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Name = "Title"
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "MM2 ULTRA V19 - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 14
KeyTitle.Parent = KeySystem

local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 12
KeyInput.Parent = KeySystem

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 4)
KeyInputCorner.Parent = KeyInput

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Name = "VerifyBtn"
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 35)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
VerifyBtn.Text = "Verify"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 12
VerifyBtn.Parent = KeySystem

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 4)
VerifyCorner.Parent = VerifyBtn

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 30)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
GetKeyBtn.BackgroundTransparency = 1
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
GetKeyBtn.Font = Enum.Font.Gotham
GetKeyBtn.TextSize = 11
GetKeyBtn.Parent = KeySystem

VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "ensomg" then
        KeySystem:Destroy()
        Main.Visible = true
    else
        VerifyBtn.Text = "WRONG KEY!"
        task.wait(2)
        VerifyBtn.Text = "Verify"
    end
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Main

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 8)
SidebarCorner.Parent = Sidebar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "MM2 ULTRA V19"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = Sidebar

local TabContainer = Instance.new("ScrollingFrame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, 0, 1, -45)
TabContainer.Position = UDim2.new(0, 0, 0, 45)
TabContainer.BackgroundTransparency = 1
TabContainer.BorderSizePixel = 0
TabContainer.ScrollBarThickness = 0
TabContainer.Parent = Sidebar

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabContainer
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabListLayout.Padding = UDim.new(0, 5)

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -140, 1, -10)
Content.Position = UDim2.new(0, 135, 0, 5)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Tabs = {}
local TabButtons = {}

local Toggles = {
    BoxESP = false,
    NameESP = false,
    HealthESP = false,
    RoleESP = false,
    MurderKillAll = false,
    Fly = false,
    InfJump = false,
    Noclip = false,
    Xray = false,
    GlobalAimbot = false,
    GlobalESP = false,
    AntiAFK = false,
    ChatSpammer = false
}

local CurrentForceSpeed = 0
local flySpeed = 50

local AimbotSettings = {
    FOV = 150,
    Smoothing = 1,
    WallCheck = true,
    TargetPart = "Head"
}

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 100
FOVCircle.Radius = AimbotSettings.FOV
FOVCircle.Filled = false
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
table.insert(shared.ESP_Storage.Drawings, FOVCircle)

local function IsVisible(targetPart, origin)
    if not AimbotSettings.WallCheck then return true end
    local ray = Ray.new(origin, (targetPart.Position - origin).Unit * 500)
    local part = workspace:FindPartOnRayWithIgnoreList(ray, {game.Players.LocalPlayer.Character, targetPart.Parent})
    return part == nil
end

local function GetNearestPlayer()
    local nearest = nil
    local shortestDistance = AimbotSettings.FOV
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild(AimbotSettings.TargetPart) and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(p.Character[AimbotSettings.TargetPart].Position)
            if onScreen then
                local mouseLoc = game:GetService("UserInputService"):GetMouseLocation()
                local distance = (Vector2.new(pos.X, pos.Y) - mouseLoc).Magnitude
                if distance < shortestDistance then
                    if IsVisible(p.Character[AimbotSettings.TargetPart], Camera.CFrame.Position) then
                        shortestDistance = distance
                        nearest = p
                    end
                end
            end
        end
    end
    return nearest
end

local function murderKillAll()
    task.spawn(function()
        while Toggles.MurderKillAll do
            local lp = game:GetService("Players").LocalPlayer
            local lpChar = lp.Character
            if lpChar and lpChar:FindFirstChild("Humanoid") and lpChar.Humanoid.Health > 0 then
                local backpack = lp:FindFirstChild("Backpack")
                local knife = (backpack and backpack:FindFirstChild("Knife")) or lpChar:FindFirstChild("Knife")
                
                if knife then
                    if knife.Parent == backpack then
                        lpChar.Humanoid:EquipTool(knife)
                    end
                    
                    local handle = knife:FindFirstChild("Handle")
                    if handle then
                        for _, p in pairs(game:GetService("Players"):GetPlayers()) do
                            if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                                if not Toggles.MurderKillAll then break end
                                if lpChar.Humanoid.Health <= 0 then break end
                                
                                local targetRoot = p.Character.HumanoidRootPart
                                local lpRoot = lpChar:FindFirstChild("HumanoidRootPart")
                                
                                if lpRoot then
                                    lpRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 1.2)
                                    if firetouchinterest then
                                        firetouchinterest(targetRoot, handle, 0)
                                        firetouchinterest(targetRoot, handle, 1)
                                    end
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

local function CreateTab(name)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(0, 110, 0, 30)
    TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 12
    TabButton.Parent = TabContainer
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    ButtonCorner.Parent = TabButton
    
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = name .. "Content"
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.BorderSizePixel = 0
    TabContent.Visible = false
    TabContent.ScrollBarThickness = 2
    TabContent.Parent = Content
    
    local ContentPadding = Instance.new("UIPadding")
    ContentPadding.PaddingTop = UDim.new(0, 5)
    ContentPadding.PaddingLeft = UDim.new(0, 5)
    ContentPadding.Parent = TabContent
    
    local ContentList = Instance.new("UIListLayout")
    ContentList.Parent = TabContent
    ContentList.Padding = UDim.new(0, 5)
    
    Tabs[name] = TabContent
    TabButtons[name] = TabButton
    
    TabButton.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do t.Visible = false end
        for _, b in pairs(TabButtons) do 
            b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        TabContent.Visible = true
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

local function CreateToggle(tabName, name, toggleKey, callback)
    local TabContent = Tabs[tabName]
    if not TabContent then return end
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = name .. "Toggle"
    ToggleButton.Size = UDim2.new(1, -10, 0, 35)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ToggleButton.Text = name .. ": OFF"
    ToggleButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    ToggleButton.Font = Enum.Font.Gotham
    ToggleButton.TextSize = 12
    ToggleButton.Parent = TabContent
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    ButtonCorner.Parent = ToggleButton
    
    ToggleButton.MouseButton1Click:Connect(function()
        Toggles[toggleKey] = not Toggles[toggleKey]
        if Toggles[toggleKey] then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.Text = name .. ": ON"
        else
            ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ToggleButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            ToggleButton.Text = name .. ": OFF"
        end
        if callback then callback(Toggles[toggleKey]) end
    end)
end

local function CreateButton(tabName, name, callback)
    local TabContent = Tabs[tabName]
    if not TabContent then return end
    
    local Button = Instance.new("TextButton")
    Button.Name = name .. "Button"
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 12
    Button.Parent = TabContent
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    ButtonCorner.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    return Button
end

CreateTab("Combat")
CreateToggle("Combat", "Global Aimbot", "GlobalAimbot")
CreateToggle("Combat", "Wall Check", "WallCheck", function(state)
    AimbotSettings.WallCheck = state
end)

CreateButton("Combat", "Increase FOV (+50)", function()
    AimbotSettings.FOV = AimbotSettings.FOV + 50
    FOVCircle.Radius = AimbotSettings.FOV
end)

CreateButton("Combat", "Decrease FOV (-50)", function()
    AimbotSettings.FOV = math.max(50, AimbotSettings.FOV - 50)
    FOVCircle.Radius = AimbotSettings.FOV
end)

table.insert(shared.ESP_Storage.Connections, RunService.RenderStepped:Connect(function()
    FOVCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
    FOVCircle.Visible = Toggles.GlobalAimbot
    
    if Toggles.GlobalAimbot then
        local target = GetNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild(AimbotSettings.TargetPart) then
            local targetPos = Camera:WorldToViewportPoint(target.Character[AimbotSettings.TargetPart].Position)
            local mouseLoc = game:GetService("UserInputService"):GetMouseLocation()
            if mousemoverel then
                mousemoverel((targetPos.X - mouseLoc.X) / AimbotSettings.Smoothing, (targetPos.Y - mouseLoc.Y) / AimbotSettings.Smoothing)
            end
        end
    end
end))

CreateTab("MM2")
CreateTab("Fling")
CreateTab("Teleport")
CreateTab("Movement")
CreateTab("Visuals")
CreateTab("Global")

-- MM2 Game Logic & ESP
-- ... (rest of the functions)

-- Targeted Fling System
-- ... (UpdateFlingList implementation)

-- Teleport System
local function UpdateTeleportList()
    local TeleportContent = Tabs["Teleport"]
    if not TeleportContent then return end
    
    for _, child in pairs(TeleportContent:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= Players.LocalPlayer then
            local PlayerFrame = Instance.new("Frame")
            PlayerFrame.Name = p.Name .. "TPFrame"
            PlayerFrame.Size = UDim2.new(1, -10, 0, 40)
            PlayerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            PlayerFrame.Parent = TeleportContent
            
            local FrameCorner = Instance.new("UICorner")
            FrameCorner.CornerRadius = UDim.new(0, 4)
            FrameCorner.Parent = PlayerFrame
            
            local NameLabel = Instance.new("TextLabel")
            NameLabel.Size = UDim2.new(0.6, -10, 1, 0)
            NameLabel.Position = UDim2.new(0, 10, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = p.Name
            NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NameLabel.Font = Enum.Font.Gotham
            NameLabel.TextSize = 12
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.Parent = PlayerFrame
            
            local TPButton = Instance.new("TextButton")
            TPButton.Size = UDim2.new(0.4, -10, 0.8, 0)
            TPButton.Position = UDim2.new(0.6, 5, 0.1, 0)
            TPButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TPButton.Text = "TP"
            TPButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            TPButton.Font = Enum.Font.Gotham
            TPButton.TextSize = 12
            TPButton.Parent = PlayerFrame
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 4)
            ButtonCorner.Parent = TPButton
            
            TPButton.MouseButton1Click:Connect(function()
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                end
            end)
        end
    end
end

table.insert(shared.ESP_Storage.Connections, Players.PlayerAdded:Connect(UpdateTeleportList))
table.insert(shared.ESP_Storage.Connections, Players.PlayerRemoving:Connect(UpdateTeleportList))
UpdateTeleportList()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

if shared.ESP_Storage then
    for _, connection in pairs(shared.ESP_Storage.Connections) do connection:Disconnect() end
    for _, drawing in pairs(shared.ESP_Storage.Drawings) do pcall(function() drawing:Remove() end) end
end
shared.ESP_Storage = { Connections = {}, Drawings = {} }

local function getRole(p)
    if not p or not p.Parent then return "Innocent" end
    local backpack = p:FindFirstChild("Backpack")
    local char = p.Character
    if (backpack and backpack:FindFirstChild("Knife")) or (char and char:FindFirstChild("Knife")) then
        return "Murderer"
    elseif (backpack and backpack:FindFirstChild("Gun")) or (char and char:FindFirstChild("Gun")) then
        return "Sheriff"
    end
    return "Innocent"
end

local function createPlayerESP(p)
    if p == Players.LocalPlayer then return end
    
    local box = Drawing.new("Square")
    box.Visible = false
    box.Thickness = 1
    box.Filled = false
    
    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Size = 13
    nameText.Center = true
    nameText.Outline = true
    
    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Size = 13
    healthText.Center = true
    healthText.Outline = true
    
    table.insert(shared.ESP_Storage.Drawings, box)
    table.insert(shared.ESP_Storage.Drawings, nameText)
    table.insert(shared.ESP_Storage.Drawings, healthText)
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local rpart = p.Character.HumanoidRootPart
            local humanoid = p.Character.Humanoid
            local pos, onScreen = Camera:WorldToViewportPoint(rpart.Position)
            
            if onScreen then
                local distance = (Camera.CFrame.Position - rpart.Position).Magnitude
                local sizeX = math.clamp(2000 / distance, 10, 150)
                local sizeY = math.clamp(3000 / distance, 15, 200)
                
                local role = getRole(p)
                local espColor = Color3.fromRGB(0, 255, 0) -- Innocent (Green)
                if Toggles.GlobalESP then
                    espColor = Color3.fromRGB(255, 255, 255) -- Global (White)
                else
                    if role == "Murderer" then
                        espColor = Color3.fromRGB(255, 0, 0) -- Murderer (Red)
                    elseif role == "Sheriff" then
                        espColor = Color3.fromRGB(0, 100, 255) -- Sheriff (Blue)
                    end
                end
                
                if Toggles.BoxESP then
                    box.Size = Vector2.new(sizeX, sizeY)
                    box.Position = Vector2.new(pos.X - sizeX / 2, pos.Y - sizeY / 2)
                    box.Color = espColor
                    box.Visible = true
                else
                    box.Visible = false
                end
                
                if Toggles.NameESP or Toggles.RoleESP then
                    local text = p.Name
                    if Toggles.RoleESP then
                        text = text .. " [" .. role:upper() .. "]"
                    end
                    nameText.Text = text
                    nameText.Position = Vector2.new(pos.X, pos.Y - (sizeY / 2) - 15)
                    nameText.Color = espColor
                    nameText.Visible = true
                else
                    nameText.Visible = false
                end
                
                if Toggles.HealthESP then
                    healthText.Text = math.floor(humanoid.Health) .. " HP"
                    healthText.Position = Vector2.new(pos.X, pos.Y + (sizeY / 2) + 5)
                    healthText.Color = Color3.fromRGB(0, 255, 0)
                    healthText.Visible = true
                else
                    healthText.Visible = false
                end
            else
                box.Visible = false
                nameText.Visible = false
                healthText.Visible = false
            end
        else
            box.Visible = false
            nameText.Visible = false
            healthText.Visible = false
            if not Players:FindFirstChild(p.Name) then
                pcall(function() box:Remove() end)
                pcall(function() nameText:Remove() end)
                pcall(function() healthText:Remove() end)
                connection:Disconnect()
            end
        end
    end)
    table.insert(shared.ESP_Storage.Connections, connection)
end

-- Initialize ESP for existing players
for _, p in pairs(Players:GetPlayers()) do
    createPlayerESP(p)
end
table.insert(shared.ESP_Storage.Connections, Players.PlayerAdded:Connect(createPlayerESP))

-- Targeted Fling System
local flinging = false
local flingTarget = nil

local function UpdateFlingList()
    local FlingContent = Tabs["Fling"]
    if not FlingContent then return end
    
    for _, child in pairs(FlingContent:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= Players.LocalPlayer then
            local PlayerFrame = Instance.new("Frame")
            PlayerFrame.Name = p.Name .. "Frame"
            PlayerFrame.Size = UDim2.new(1, -10, 0, 40)
            PlayerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            PlayerFrame.Parent = FlingContent
            
            local FrameCorner = Instance.new("UICorner")
            FrameCorner.CornerRadius = UDim.new(0, 4)
            FrameCorner.Parent = PlayerFrame
            
            local NameLabel = Instance.new("TextLabel")
            NameLabel.Size = UDim2.new(0.6, -10, 1, 0)
            NameLabel.Position = UDim2.new(0, 10, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = p.Name
            NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NameLabel.Font = Enum.Font.Gotham
            NameLabel.TextSize = 12
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.Parent = PlayerFrame
            
            local FlingButton = Instance.new("TextButton")
            FlingButton.Size = UDim2.new(0.4, -10, 0.8, 0)
            FlingButton.Position = UDim2.new(0.6, 5, 0.1, 0)
            FlingButton.BackgroundColor3 = (flinging and flingTarget == p) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(45, 45, 45)
            FlingButton.Text = (flinging and flingTarget == p) and "Stop" or "Fling"
            FlingButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            FlingButton.Font = Enum.Font.Gotham
            FlingButton.TextSize = 12
            FlingButton.Parent = PlayerFrame
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 4)
            ButtonCorner.Parent = FlingButton
            
            FlingButton.MouseButton1Click:Connect(function()
                if flinging then
                    local oldTarget = flingTarget
                    flinging = false
                    flingTarget = nil
                    if oldTarget == p then
                        UpdateFlingList()
                        return
                    end
                    task.wait(0.1)
                end
                
                local target = p
                if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end
                
                flinging = true
                flingTarget = target
                UpdateFlingList()
                
                task.spawn(function()
                    local oldPos = nil
                    local lpChar = Players.LocalPlayer.Character
                    if lpChar and lpChar:FindFirstChild("HumanoidRootPart") then
                        oldPos = lpChar.HumanoidRootPart.CFrame
                    end

                    while flinging and flingTarget == target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") do
                        local localChar = Players.LocalPlayer.Character
                        local targetChar = target.Character
                        
                        if localChar and targetChar then
                            local localRoot = localChar:FindFirstChild("HumanoidRootPart")
                            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                            
                            if localRoot and targetRoot then
                                for _, part in pairs(localChar:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CanCollide = false
                                    end
                                end
                                localRoot.CFrame = targetRoot.CFrame
                                localRoot.Velocity = Vector3.new(0, 0, 0)
                                localRoot.RotVelocity = Vector3.new(0, 999999, 0)
                            end
                        end
                        RunService.Heartbeat:Wait()
                    end
                    
                    if flingTarget == target then
                        flinging = false
                        flingTarget = nil
                    end
                    
                    local char = Players.LocalPlayer.Character
                    if char then
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = true
                            end
                        end
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if root then
                            root.RotVelocity = Vector3.new(0, 0, 0)
                            if oldPos then
                                root.CFrame = oldPos
                            end
                        end
                    end
                    UpdateFlingList()
                end)
            end)
        end
    end
end

table.insert(shared.ESP_Storage.Connections, Players.PlayerAdded:Connect(UpdateFlingList))
table.insert(shared.ESP_Storage.Connections, Players.PlayerRemoving:Connect(UpdateFlingList))
UpdateFlingList()

-- Global Tab Features
local TeleportService = game:GetService("TeleportService")

CreateButton("Global", "Load Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

CreateToggle("Global", "Anti-AFK", "AntiAFK", function(state)
    if state then
        local lp = game:GetService("Players").LocalPlayer
        lp.Idled:Connect(function()
            if Toggles.AntiAFK then
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end
        end)
    end
end)

local chatSpamming = false
CreateToggle("Global", "Chat Spammer", "ChatSpammer", function(state)
    chatSpamming = state
    if state then
        task.spawn(function()
            while chatSpamming do
                local args = {
                    [1] = "MM2 ULTRA V19 ON TOP!",
                    [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                task.wait(3)
            end
        end)
    end
end)

CreateButton("Global", "Server Hop", function()
    local HttpService = game:GetService("HttpService")
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, s in pairs(servers) do
        if s.id ~= game.JobId and s.playing < s.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
            break
        end
    end
end)

CreateButton("Global", "Rejoin Server", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

-- Visuals Tab Toggles
CreateToggle("Visuals", "Global ESP", "GlobalESP")
CreateToggle("Visuals", "Box ESP", "BoxESP")
CreateToggle("Visuals", "Name ESP", "NameESP")
CreateToggle("Visuals", "Health ESP", "HealthESP")
CreateToggle("Visuals", "Role ESP", "RoleESP")
CreateToggle("Visuals", "Xray", "Xray", function(state)
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part:IsDescendantOf(game:GetService("Players").LocalPlayer.Character) and not part.Parent:FindFirstChildOfClass("Humanoid") then
            if state then
                if not part:FindFirstChild("OriginalTransparency") then
                    local val = Instance.new("NumberValue")
                    val.Name = "OriginalTransparency"
                    val.Value = part.Transparency
                    val.Parent = part
                end
                part.Transparency = 0.5
            else
                local val = part:FindFirstChild("OriginalTransparency")
                if val then
                    part.Transparency = val.Value
                    val:Destroy()
                end
            end
        end
    end
end)

-- MM2 Tab Toggles
CreateToggle("MM2", "Murder Kill All", "MurderKillAll", function(state)
    if state then murderKillAll() end
end)

-- Speed Logic
table.insert(shared.ESP_Storage.Connections, RunService.Heartbeat:Connect(function(deltaTime)
    if CurrentForceSpeed > 0 and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hrp = Players.LocalPlayer.Character.HumanoidRootPart
        local humanoid = Players.LocalPlayer.Character.Humanoid
        if humanoid.MoveDirection.Magnitude > 0 then
            hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection.Unit * CurrentForceSpeed * deltaTime)
        end
    end
end))

-- Fly Logic Implementation
local flyBV, flyBG
local function startFly()
    local lp = Players.LocalPlayer
    local char = lp.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBV.Velocity = Vector3.new(0, 0, 0)
    flyBV.Parent = hrp
    
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyBG.P = 10000
    flyBG.CFrame = hrp.CFrame
    flyBG.Parent = hrp
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.PlatformStand = true end
    
    task.spawn(function()
        while Toggles.Fly and char and char.Parent and hrp and hrp.Parent do
            local moveDirection = Vector3.new(0, 0, 0)
            local UIS = game:GetService("UserInputService")
            
            if UIS:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + Camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - Camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - Camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + Camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0, 1, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection = moveDirection - Vector3.new(0, 1, 0) end
            
            if moveDirection.Magnitude > 0 then
                flyBV.Velocity = moveDirection.Unit * flySpeed
            else
                flyBV.Velocity = Vector3.new(0, 0, 0)
            end
            
            flyBG.CFrame = Camera.CFrame
            RunService.RenderStepped:Wait()
        end
        if flyBV then flyBV:Destroy() end
        if flyBG then flyBG:Destroy() end
        if humanoid then humanoid.PlatformStand = false end
    end)
end

-- InfJump Logic
table.insert(shared.ESP_Storage.Connections, game:GetService("UserInputService").JumpRequest:Connect(function()
    if Toggles.InfJump and Players.LocalPlayer.Character then
        local humanoid = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end))

-- Noclip Logic
table.insert(shared.ESP_Storage.Connections, RunService.Stepped:Connect(function()
    if Toggles.Noclip and Players.LocalPlayer.Character then
        for _, part in pairs(Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end))

-- Movement Tab Features
CreateToggle("Movement", "Fly Mode", "Fly", function(state)
    if state then
        startFly()
    end
end)
CreateToggle("Movement", "Infinite Jump", "InfJump")
CreateToggle("Movement", "Noclip", "Noclip")

local speedButtons = {}
local function CreateSpeedButton(speedValue, name)
    local btn = CreateButton("Movement", name, function()
        CurrentForceSpeed = speedValue
        for val, b in pairs(speedButtons) do
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        if speedValue > 0 then
            speedButtons[speedValue].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            speedButtons[speedValue].TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)
    speedButtons[speedValue] = btn
end

CreateSpeedButton(0, "Speed: Normal")
CreateSpeedButton(15, "Speed: Legit (+15)")
CreateSpeedButton(40, "Speed: Fast (+40)")
CreateSpeedButton(80, "Speed: Ultra (+80)")

-- Keybind to open/close
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.LeftControl then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

-- Default Tab
if TabButtons["MM2"] then
    TabButtons["MM2"].BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButtons["MM2"].TextColor3 = Color3.fromRGB(255, 255, 255)
    Tabs["MM2"].Visible = true
end
