-- =============================================================================
--  MM2 ULTRA HACK V19 - FINAL EDITION
--  Key: ensomg
--  [LEFT CTRL]: Toggle Menu
-- =============================================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- Cleanup existing
local oldGui = game:GetService("CoreGui"):FindFirstChild("MM2_Ultra_V19")
if oldGui then oldGui:Destroy() end

if shared.ESP_Storage then
    for _, connection in pairs(shared.ESP_Storage.Connections) do connection:Disconnect() end
    for _, drawing in pairs(shared.ESP_Storage.Drawings) do pcall(function() drawing:Remove() end) end
end
shared.ESP_Storage = { Connections = {}, Drawings = {} }

-- --- UI CONSTRUCTION ---
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2_Ultra_V19"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Enabled = true

-- --- KEY SYSTEM ---
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeySystem"
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "MM2 ULTRA V19 - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 14
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 12
KeyInput.Parent = KeyFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 4)

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 35)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
VerifyBtn.Text = "Verify"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 12
VerifyBtn.Parent = KeyFrame
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 4)

-- --- MAIN MENU ---
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 550, 0, 380)
Main.Position = UDim2.new(0.5, -275, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = false
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, 0, 0, 50)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "ULTRA V19"
SidebarTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
SidebarTitle.Font = Enum.Font.GothamBold
SidebarTitle.TextSize = 18
SidebarTitle.Parent = Sidebar

local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Size = UDim2.new(1, 0, 1, -60)
TabScroll.Position = UDim2.new(0, 0, 0, 55)
TabScroll.BackgroundTransparency = 1
TabScroll.BorderSizePixel = 0
TabScroll.ScrollBarThickness = 0
TabScroll.Parent = Sidebar

local TabList = Instance.new("UIListLayout")
TabList.Parent = TabScroll
TabList.Padding = UDim.new(0, 5)
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -150, 1, -10)
Content.Position = UDim2.new(0, 145, 0, 5)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Tabs = {}
local TabButtons = {}

local function CreateTab(name)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 120, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 12
    Btn.Parent = TabScroll
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.Parent = Content
    Instance.new("UIListLayout", Page).Padding = UDim.new(0, 5)
    Instance.new("UIPadding", Page).PaddingLeft = UDim.new(0, 5)

    Tabs[name] = Page
    TabButtons[name] = Btn

    Btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Tabs) do p.Visible = false end
        for _, b in pairs(TabButtons) do b.BackgroundColor3 = Color3.fromRGB(35, 35, 35) b.TextColor3 = Color3.fromRGB(200, 200, 200) end
        Page.Visible = true
        Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

local Toggles = {}
local function CreateToggle(tabName, name, toggleKey, callback)
    local Tab = Tabs[tabName]
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 35)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = name .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 12
    Btn.Parent = Tab
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    Toggles[toggleKey] = false
    Btn.MouseButton1Click:Connect(function()
        Toggles[toggleKey] = not Toggles[toggleKey]
        if Toggles[toggleKey] then
            Btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.Text = name .. ": ON"
        else
            Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            Btn.Text = name .. ": OFF"
        end
        if callback then callback(Toggles[toggleKey]) end
    end)
end

local function CreateButton(tabName, name, callback)
    local Tab = Tabs[tabName]
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 35)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 12
    Btn.Parent = Tab
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
    Btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    return Btn
end

-- Create Tabs
CreateTab("MM2")
CreateTab("Combat")
CreateTab("Fling")
CreateTab("Teleport")
CreateTab("Movement")
CreateTab("Visuals")
CreateTab("Natural Disaster")
CreateTab("Global")

-- --- FEATURES LOGIC ---

-- MM2 Roles
local function getRole(p)
    if not p or not p.Parent then return "Innocent" end
    local b = p:FindFirstChild("Backpack")
    local c = p.Character
    if (b and b:FindFirstChild("Knife")) or (c and c:FindFirstChild("Knife")) then return "Murderer" end
    if (b and b:FindFirstChild("Gun")) or (c and c:FindFirstChild("Gun")) then return "Sheriff" end
    return "Innocent"
end

-- MM2 Kill All
CreateToggle("MM2", "Murder Kill All", "MurderKillAll", function(state)
    task.spawn(function()
        while Toggles.MurderKillAll do
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and getRole(LocalPlayer) == "Murderer" then
                local knife = char:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")
                if knife then
                    char.Humanoid:EquipTool(knife)
                    local handle = knife:FindFirstChild("Handle")
                    for _, v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                            char.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.2)
                            if firetouchinterest then firetouchinterest(v.Character.HumanoidRootPart, handle, 0) firetouchinterest(v.Character.HumanoidRootPart, handle, 1) end
                            task.wait(0.15)
                        end
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end)

-- Combat (Aimbot)
local AimbotSettings = { FOV = 150, WallCheck = true, TargetPart = "Head" }
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness, FOVCircle.NumSides, FOVCircle.Radius, FOVCircle.Visible, FOVCircle.Color = 1, 100, AimbotSettings.FOV, false, Color3.new(1, 1, 1)
table.insert(shared.ESP_Storage.Drawings, FOVCircle)

local function isVisible(target)
    if not AimbotSettings.WallCheck then return true end
    local ray = Ray.new(Camera.CFrame.Position, (target.Position - Camera.CFrame.Position).Unit * 1000)
    local part = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, target.Parent})
    return part == nil
end

CreateToggle("Combat", "Global Aimbot", "Aimbot", function(state) FOVCircle.Visible = state end)
CreateToggle("Combat", "Wall Check", "WallCheck", function(state) AimbotSettings.WallCheck = state end)
CreateButton("Combat", "FOV +50", function() AimbotSettings.FOV = AimbotSettings.FOV + 50 FOVCircle.Radius = AimbotSettings.FOV end)
CreateButton("Combat", "FOV -50", function() AimbotSettings.FOV = math.max(10, AimbotSettings.FOV - 50) FOVCircle.Radius = AimbotSettings.FOV end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    if Toggles.Aimbot then
        local nearest = nil
        local shortDist = AimbotSettings.FOV
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild(AimbotSettings.TargetPart) and p.Character.Humanoid.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(p.Character[AimbotSettings.TargetPart].Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if dist < shortDist and isVisible(p.Character[AimbotSettings.TargetPart]) then
                        shortDist = dist nearest = p
                    end
                end
            end
        end
        if nearest and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, nearest.Character[AimbotSettings.TargetPart].Position)
        end
    end
end)

-- List Updates (Fling & Teleport)
local function UpdateLists()
    for _, tabName in pairs({"Fling", "Teleport"}) do
        local page = Tabs[tabName]
        for _, c in pairs(page:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local f = Instance.new("Frame") f.Size = UDim2.new(1, -10, 0, 40) f.BackgroundColor3 = Color3.fromRGB(30, 30, 30) f.Parent = page
                Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)
                local l = Instance.new("TextLabel") l.Size = UDim2.new(0.6, 0, 1, 0) l.Position = UDim2.new(0, 10, 0, 0) l.BackgroundTransparency = 1 l.Text = p.Name l.TextColor3 = Color3.new(1,1,1) l.TextXAlignment = Enum.TextXAlignment.Left l.Parent = f
                local b = Instance.new("TextButton") b.Size = UDim2.new(0.35, 0, 0.8, 0) b.Position = UDim2.new(0.6, 0, 0.1, 0) b.BackgroundColor3 = Color3.fromRGB(45, 45, 45) b.Text = tabName == "Fling" and "Fling" or "TP" b.TextColor3 = Color3.new(1,1,1) b.Parent = f
                Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
                
                b.MouseButton1Click:Connect(function()
                    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        if tabName == "Teleport" then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                        else
                            local old = LocalPlayer.Character.HumanoidRootPart.CFrame
                            local t = p.Character.HumanoidRootPart
                            local start = tick()
                            while tick() - start < 3 do
                                if not p.Parent or not p.Character then break end
                                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
                                LocalPlayer.Character.HumanoidRootPart.CFrame = t.CFrame
                                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                                LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 999999, 0)
                                RunService.Heartbeat:Wait()
                            end
                            LocalPlayer.Character.HumanoidRootPart.CFrame = old
                            LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = true end end
                        end
                    end
                end)
            end
        end
    end
end
Players.PlayerAdded:Connect(UpdateLists) Players.PlayerRemoving:Connect(UpdateLists) UpdateLists()

-- Movement
local speedVal = 0
CreateButton("Movement", "Speed: Normal", function() speedVal = 0 end)
CreateButton("Movement", "Speed: Legit (+15)", function() speedVal = 15 end)
CreateButton("Movement", "Speed: Fast (+40)", function() speedVal = 40 end)
CreateButton("Movement", "Speed: Ultra (+80)", function() speedVal = 80 end)
CreateToggle("Movement", "Fly Mode", "Fly", function(state)
    local bv, bg
    if state then
        bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart) bv.MaxForce = Vector3.new(1,1,1) * math.huge
        bg = Instance.new("BodyGyro", LocalPlayer.Character.HumanoidRootPart) bg.MaxTorque = Vector3.new(1,1,1) * math.huge
        LocalPlayer.Character.Humanoid.PlatformStand = true
        task.spawn(function()
            while Toggles.Fly do
                local dir = Vector3.new(0,0,0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end
                bv.Velocity = dir * 50 bg.CFrame = Camera.CFrame
                RunService.RenderStepped:Wait()
            end
            bv:Destroy() bg:Destroy() LocalPlayer.Character.Humanoid.PlatformStand = false
        end)
    end
end)
CreateToggle("Movement", "Noclip", "Noclip")
CreateToggle("Movement", "Inf Jump", "InfJump")
RunService.Heartbeat:Connect(function(dt)
    if speedVal > 0 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + (LocalPlayer.Character.Humanoid.MoveDirection * speedVal * dt)
    end
    if Toggles.Noclip and LocalPlayer.Character then for _, v in pairs(LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
end)
UserInputService.JumpRequest:Connect(function() if Toggles.InfJump then LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end)

-- Visuals
local function createESP(p)
    local box, name = Drawing.new("Square"), Drawing.new("Text")
    box.Thickness, box.Filled, box.Visible = 1, false, false
    name.Size, name.Center, name.Outline, name.Visible = 13, true, true, false
    table.insert(shared.ESP_Storage.Drawings, box) table.insert(shared.ESP_Storage.Drawings, name)
    local c; c = RunService.RenderStepped:Connect(function()
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
            if onScreen then
                local dist = (Camera.CFrame.Position - p.Character.HumanoidRootPart.Position).Magnitude
                local size = Vector2.new(2000/dist, 3000/dist)
                local role = getRole(p)
                local color = Toggles.GlobalESP and Color3.new(1,1,1) or (role == "Murderer" and Color3.new(1,0,0) or (role == "Sheriff" and Color3.new(0,0.4,1) or Color3.new(0,1,0)))
                if Toggles.BoxESP then box.Size, box.Position, box.Color, box.Visible = size, Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2), color, true else box.Visible = false end
                if Toggles.NameESP then name.Text = p.Name .. (Toggles.RoleESP and " ["..role.."]" or "") name.Position, name.Color, name.Visible = Vector2.new(pos.X, pos.Y - size.Y/2 - 15), color, true else name.Visible = false end
            else box.Visible = false name.Visible = false end
        else box.Visible = false name.Visible = false if not p.Parent then c:Disconnect() pcall(function() box:Remove() name:Remove() end) end end
    end)
    table.insert(shared.ESP_Storage.Connections, c)
end
for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then createESP(p) end end
Players.PlayerAdded:Connect(createESP)

CreateToggle("Visuals", "Global ESP", "GlobalESP")
CreateToggle("Visuals", "Box ESP", "BoxESP")
CreateToggle("Visuals", "Name ESP", "NameESP")
CreateToggle("Visuals", "Role ESP", "RoleESP")
CreateToggle("Visuals", "Xray", "Xray", function(state)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) and not v.Parent:FindFirstChild("Humanoid") then
            if state then if not v:FindFirstChild("OrigT") then local n = Instance.new("NumberValue", v) n.Name = "OrigT" n.Value = v.Transparency end v.Transparency = 0.5
            else local n = v:FindFirstChild("OrigT") if n then v.Transparency = n.Value n:Destroy() end end
        end
    end
end)

-- Natural Disaster (Tornado)
local ringRadius = 50
local ringParts = {}
local function RetainPart(part)
    if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(workspace) and not part:IsDescendantOf(LocalPlayer.Character) then
        part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
        part.CanCollide = false
        return true
    end
    return false
end
workspace.DescendantAdded:Connect(function(v) if RetainPart(v) then table.insert(ringParts, v) end end)
for _, v in pairs(workspace:GetDescendants()) do if RetainPart(v) then table.insert(ringParts, v) end end

CreateToggle("Natural Disaster", "Tornado / Ring Parts", "Tornado")
CreateButton("Natural Disaster", "Radius +10", function() ringRadius = ringRadius + 10 end)
CreateButton("Natural Disaster", "Radius -10", function() ringRadius = math.max(5, ringRadius - 10) end)

RunService.Heartbeat:Connect(function()
    if Toggles.Tornado and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
        local center = LocalPlayer.Character.HumanoidRootPart.Position
        for i, part in pairs(ringParts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local dist = (Vector3.new(pos.X, center.Y, pos.Z) - center).Magnitude
                local angle = math.atan2(pos.Z - center.Z, pos.X - center.X)
                local newAngle = angle + math.rad(5)
                local target = Vector3.new(center.X + math.cos(newAngle) * math.min(ringRadius, dist), center.Y + (50 * math.abs(math.sin((pos.Y - center.Y)/50))), center.Z + math.sin(newAngle) * math.min(ringRadius, dist))
                part.Velocity = (target - part.Position).Unit * 150
            else table.remove(ringParts, i) end
        end
    end
end)

-- Global
CreateButton("Global", "Load Infinite Yield", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
CreateToggle("Global", "Anti-AFK", "AntiAFK", function(state) if state then LocalPlayer.Idled:Connect(function() if Toggles.AntiAFK then game:GetService("VirtualUser"):CaptureController() game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end end) end end)
CreateToggle("Global", "Chat Spammer", "ChatSpammer", function(state)
    task.spawn(function()
        while Toggles.ChatSpammer do
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("MM2 ULTRA V19 ON TOP!", "All")
            task.wait(3)
        end
    end)
end)
CreateButton("Global", "Server Hop", function()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, s in pairs(servers) do if s.id ~= game.JobId and s.playing < s.maxPlayers then TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id) break end end
end)
CreateButton("Global", "Rejoin", function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId) end)

-- Key Logic
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "ensomg" then
        KeyFrame:Destroy()
        Main.Visible = true
    else
        VerifyBtn.Text = "WRONG KEY!"
        task.wait(2)
        VerifyBtn.Text = "Verify"
    end
end)

-- Toggle Menu
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.LeftControl then
        Main.Visible = not Main.Visible
    end
end)

-- Default Tab
TabButtons["MM2"].BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabButtons["MM2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Tabs["MM2"].Visible = true
