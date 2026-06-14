-- =============================================================================
--  MM2 ULTRA HACK V19 - SUPER OPTIMIZED EDITION
--  Key: ensomg
--  [LEFT CTRL]: Toggle Menu
-- =============================================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- UI Parent Check
local UIParent = game:GetService("CoreGui") or LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- Cleanup
local oldGui = UIParent:FindFirstChild("MM2_Ultra_V19")
if oldGui then oldGui:Destroy() end

if shared.ESP_Storage then
    for _, v in pairs(shared.ESP_Storage.Connections) do v:Disconnect() end
    for _, v in pairs(shared.ESP_Storage.Drawings) do pcall(function() v:Remove() end) end
end
shared.ESP_Storage = { Connections = {}, Drawings = {} }

-- UI Construction (Simplified & Optimized)
local ScreenGui = Instance.new("ScreenGui", UIParent)
ScreenGui.Name = "MM2_Ultra_V19"
ScreenGui.ResetOnSpawn = false

local function createCorner(p, r)
    local c = Instance.new("UICorner", p)
    c.CornerRadius = UDim.new(0, r or 8)
    return c
end

-- Key System
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 260, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -130, 0.5, -75)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
createCorner(KeyFrame)

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Text = "KEY: ensomg"
KeyTitle.TextColor3 = Color3.new(1,1,1)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Font = Enum.Font.GothamBold

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0, 30)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter Key..."
KeyInput.TextColor3 = Color3.new(1,1,1)
createCorner(KeyInput, 4)

local VerifyBtn = Instance.new("TextButton", KeyFrame)
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 30)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
VerifyBtn.Text = "Verify"
VerifyBtn.TextColor3 = Color3.new(1,1,1)
createCorner(VerifyBtn, 4)

-- Main Menu
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 500, 0, 340)
Main.Position = UDim2.new(0.5, -250, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Visible = false
Main.Active = true
Main.Draggable = true
createCorner(Main)

local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
createCorner(Sidebar)

local TabContainer = Instance.new("ScrollingFrame", Sidebar)
TabContainer.Size = UDim2.new(1, 0, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundTransparency = 1
TabContainer.CanvasSize = UDim2.new(0,0,1.5,0)
TabContainer.ScrollBarThickness = 0
local TabList = Instance.new("UIListLayout", TabContainer)
TabList.Padding = UDim.new(0, 5)
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -140, 1, -10)
Content.Position = UDim2.new(0, 135, 0, 5)
Content.BackgroundTransparency = 1

local Tabs, TabBtns = {}, {}
local function CreateTab(name)
    local b = Instance.new("TextButton", TabContainer)
    b.Size = UDim2.new(0, 110, 0, 28)
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    b.TextSize = 11
    createCorner(b, 4)

    local p = Instance.new("ScrollingFrame", Content)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 2
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 5)

    Tabs[name] = p
    TabBtns[name] = b
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Tabs) do v.Visible = false end
        for _, v in pairs(TabBtns) do v.BackgroundColor3 = Color3.fromRGB(40, 40, 40) v.TextColor3 = Color3.fromRGB(200, 200, 200) end
        p.Visible = true
        b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        b.TextColor3 = Color3.new(1,1,1)
    end)
end

local Toggles = {}
local function CreateToggle(tab, name, key, callback)
    local b = Instance.new("TextButton", Tabs[tab])
    b.Size = UDim2.new(1, -10, 0, 32)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Text = name .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    b.TextSize = 11
    createCorner(b, 4)

    Toggles[key] = false
    b.MouseButton1Click:Connect(function()
        Toggles[key] = not Toggles[key]
        b.Text = name .. (Toggles[key] and ": ON" or ": OFF")
        b.BackgroundColor3 = Toggles[key] and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(35, 35, 35)
        if callback then callback(Toggles[key]) end
    end)
end

local function CreateButton(tab, name, callback)
    local b = Instance.new("TextButton", Tabs[tab])
    b.Size = UDim2.new(1, -10, 0, 32)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Text = name
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Gotham
    b.TextSize = 11
    createCorner(b, 4)
    b.MouseButton1Click:Connect(function() if callback then callback() end end)
end

-- Initialize Tabs
for _, v in pairs({"MM2", "Farm", "Combat", "Fling", "Teleport", "Movement", "Visuals", "Global", "Tornado"}) do CreateTab(v) end

-- --- Optimized Logic ---

-- Role Detection (Cached)
local roleCache = {}
local function getRole(p)
    if roleCache[p] then return roleCache[p] end
    local r = "Innocent"
    local b = p:FindFirstChild("Backpack")
    local c = p.Character
    if (b and b:FindFirstChild("Knife")) or (c and c:FindFirstChild("Knife")) then r = "Murderer"
    elseif (b and b:FindFirstChild("Gun")) or (c and c:FindFirstChild("Gun")) then r = "Sheriff" end
    roleCache[p] = r
    return r
end
task.spawn(function() while task.wait(2) do roleCache = {} end end)

-- MM2 Kill All
CreateToggle("MM2", "Murder Kill All", "KillAll", function(state)
    task.spawn(function()
        while Toggles.KillAll do
            if getRole(LocalPlayer) == "Murderer" then
                local knife = LocalPlayer.Character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")
                if knife then
                    LocalPlayer.Character.Humanoid:EquipTool(knife)
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.2)
                            if firetouchinterest then firetouchinterest(p.Character.HumanoidRootPart, knife.Handle, 0) firetouchinterest(p.Character.HumanoidRootPart, knife.Handle, 1) end
                            task.wait(0.1)
                        end
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end)

-- Kill Aura (Reach)
CreateToggle("MM2", "Kill Aura (Reach)", "KillAura", function(state)
    task.spawn(function()
        while Toggles.KillAura do
            if getRole(LocalPlayer) == "Murderer" then
                local knife = LocalPlayer.Character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")
                if knife then
                    local handle = knife:FindFirstChild("Handle")
                    if handle then
                        for _, p in pairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                                if dist <= 20 then
                                    if firetouchinterest then
                                        firetouchinterest(p.Character.HumanoidRootPart, handle, 0)
                                        firetouchinterest(p.Character.HumanoidRootPart, handle, 1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- Auto-Announce Murderer
local announcedMurderer = nil
CreateToggle("MM2", "Auto-Announce Murderer", "AutoAnnounce", function(state)
    task.spawn(function()
        while Toggles.AutoAnnounce do
            for _, p in pairs(Players:GetPlayers()) do
                if getRole(p) == "Murderer" and announcedMurderer ~= p.Name then
                    announcedMurderer = p.Name
                    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") and game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
                    if remote then
                        remote:FireServer("[ULTRA V19] MURDERER IS: " .. p.Name .. "!", "All")
                    end
                end
            end
            task.wait(1)
        end
    end)
end)

-- Trap ESP & Disabler
local trapDrawings = {}
CreateToggle("MM2", "Trap ESP & Disabler", "TrapHack", function(state)
    task.spawn(function()
        while Toggles.TrapHack do
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Trap" and v:IsA("BasePart") then
                    if not trapDrawings[v] then
                        local box = Drawing.new("Square")
                        box.Thickness = 1
                        box.Color = Color3.new(1, 0.5, 0)
                        box.Visible = false
                        trapDrawings[v] = box
                    end
                    local pos, vis = Camera:WorldToViewportPoint(v.Position)
                    if vis then
                        trapDrawings[v].Size = Vector2.new(1000/pos.Z, 1000/pos.Z)
                        trapDrawings[v].Position = Vector2.new(pos.X - trapDrawings[v].Size.X/2, pos.Y - trapDrawings[v].Size.Y/2)
                        trapDrawings[v].Visible = true
                    else
                        trapDrawings[v].Visible = false
                    end
                    v.CFrame = CFrame.new(0, 1000, 0) -- Teleport trap away
                end
            end
            task.wait(0.5)
        end
        for _, v in pairs(trapDrawings) do v.Visible = false end
    end)
end)

-- Farm Tab Features
CreateToggle("Farm", "Auto-Farm Coins", "CoinFarm", function(state)
    task.spawn(function()
        while Toggles.CoinFarm do
            local container = workspace:FindFirstChild("Normal") and workspace.Normal:FindFirstChild("CoinContainer")
            if container then
                for _, coin in pairs(container:GetChildren()) do
                    if not Toggles.CoinFarm then break end
                    if (coin:IsA("BasePart") or coin:FindFirstChild("TouchInterest")) and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame
                        task.wait(0.15)
                    end
                end
            end
            task.wait(1)
        end
    end)
end)

CreateToggle("Farm", "Grab Dropped Gun", "GrabGun", function(state)
    task.spawn(function()
        while Toggles.GrabGun do
            local gun = workspace:FindFirstChild("GunDrop")
            if gun and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = gun.CFrame
            end
            task.wait(0.5)
        end
    end)
end)

-- Combat Tab Features
CreateToggle("Combat", "Silent Aim", "SilentAim")
RunService.RenderStepped:Connect(function()
    if Toggles.SilentAim and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        local target = nil
        local dist = 100 -- Max distance for snap
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character.Humanoid.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(p.Character.Head.Position)
                if onScreen then
                    local d = (Vector2.new(screenPos.X, screenPos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if d < dist then
                        dist = d
                        target = p
                    end
                end
            end
        end
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

-- Silent Sheriff (Auto-Shoot)
CreateToggle("Combat", "Silent Sheriff (Auto-Shoot)", "AutoShoot", function(state)
    task.spawn(function()
        while Toggles.AutoShoot do
            if getRole(LocalPlayer) == "Sheriff" then
                local gun = LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
                if gun then
                    local murderer = nil
                    for _, p in pairs(Players:GetPlayers()) do
                        if getRole(p) == "Murderer" and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                            murderer = p
                            break
                        end
                    end
                    
                    if murderer then
                        local hrp = murderer.Character.HumanoidRootPart
                        local _, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                        if onScreen then
                            local ray = Ray.new(Camera.CFrame.Position, (hrp.Position - Camera.CFrame.Position).Unit * 500)
                            local hit = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, Camera})
                            if hit and hit:IsDescendantOf(murderer.Character) then
                                local shoot = gun:FindFirstChild("KnifeServer") or gun:FindFirstChild("Shoot") or gun:FindFirstChild("RemoteEvent")
                                if shoot and (shoot:IsA("RemoteEvent") or shoot:IsA("RemoteFunction")) then
                                    if shoot:IsA("RemoteEvent") then shoot:FireServer(hrp.Position) else shoot:InvokeServer(hrp.Position) end
                                end
                            end
                        end
                    end
                end
            end
            task.wait(0.2)
        end
    end)
end)

-- Movement Tab Features
CreateToggle("Movement", "Fake Lag / Desync", "FakeLag", function(state)
    task.spawn(function()
        while Toggles.FakeLag do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Anchored = true
                task.wait(0.1)
                LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end
            task.wait(0.1)
        end
    end)
end)

-- Visuals Tab Features
local Lighting = game:GetService("Lighting")
CreateToggle("Visuals", "Fullbright", "Fullbright", function(state)
    task.spawn(function()
        while Toggles.Fullbright do
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            task.wait(0.5)
        end
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end)
end)

-- Global Tab Features
local emotes = {"dance", "dance2", "dance3", "wave", "cheer", "laugh"}
CreateToggle("Global", "Emote Spammer", "EmoteSpam", function(state)
    task.spawn(function()
        while Toggles.EmoteSpam do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") and game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
            if remote then
                remote:FireServer("/e " .. emotes[math.random(1, #emotes)], "All")
            end
            task.wait(3)
        end
    end)
end)

-- Tornado (Optimized)
local ringRadius = 50
local ringParts = {}
local function isPhysics(v) return v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(LocalPlayer.Character) and not v.Parent:FindFirstChild("Humanoid") end
task.spawn(function()
    while task.wait(5) do
        if Toggles.Tornado then
            ringParts = {}
            for _, v in pairs(workspace:GetDescendants()) do if isPhysics(v) then table.insert(ringParts, v) end end
        end
    end
end)

CreateToggle("Tornado", "Enable Tornado", "Tornado")
CreateButton("Tornado", "Radius +10", function() ringRadius = ringRadius + 10 end)
CreateButton("Tornado", "Radius -10", function() ringRadius = math.max(5, ringRadius - 10) end)

RunService.Heartbeat:Connect(function()
    if Toggles.Tornado and LocalPlayer.Character then
        local center = LocalPlayer.Character.PrimaryPart.Position
        for _, p in pairs(ringParts) do
            if p.Parent then
                local pos = p.Position
                local angle = math.atan2(pos.Z - center.Z, pos.X - center.X) + 0.1
                local target = Vector3.new(center.X + math.cos(angle) * ringRadius, center.Y + 10, center.Z + math.sin(angle) * ringRadius)
                p.Velocity = (target - p.Position) * 10
            end
        end
    end
end)

-- Lists (Fling/TP)
local function updateLists()
    for _, tab in pairs({"Fling", "Teleport"}) do
        local page = Tabs[tab]
        for _, v in pairs(page:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local f = Instance.new("Frame", page) f.Size = UDim2.new(1, -10, 0, 30) f.BackgroundColor3 = Color3.fromRGB(30, 30, 30) createCorner(f, 4)
                local l = Instance.new("TextLabel", f) l.Size = UDim2.new(0.6, 0, 1, 0) l.Position = UDim2.new(0, 5, 0, 0) l.Text = p.Name l.TextColor3 = Color3.new(1,1,1) l.BackgroundTransparency = 1 l.TextXAlignment = 0
                local b = Instance.new("TextButton", f) b.Size = UDim2.new(0.3, 0, 0.8, 0) b.Position = UDim2.new(0.65, 0, 0.1, 0) b.Text = tab == "Fling" and "Fling" or "TP" b.BackgroundColor3 = Color3.fromRGB(50,50,50) createCorner(b, 4)
                b.MouseButton1Click:Connect(function()
                    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        if tab == "Teleport" then LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                        else
                            local hrp = LocalPlayer.Character.HumanoidRootPart
                            local start = tick()
                            while tick() - start < 2 do
                                hrp.CFrame = p.Character.HumanoidRootPart.CFrame
                                hrp.RotVelocity = Vector3.new(0, 99999, 0)
                                task.wait()
                            end
                            hrp.RotVelocity = Vector3.new(0,0,0)
                        end
                    end
                end)
            end
        end
    end
end
Players.PlayerAdded:Connect(updateLists) Players.PlayerRemoving:Connect(updateLists) updateLists()

-- ESP (Simple & Fast)
local function addESP(p)
    local box = Drawing.new("Square")
    box.Thickness = 1
    table.insert(shared.ESP_Storage.Drawings, box)
    local c; c = RunService.RenderStepped:Connect(function()
        if Toggles.ESP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local pos, vis = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
            if vis then
                box.Size = Vector2.new(2000/pos.Z, 3000/pos.Z)
                box.Position = Vector2.new(pos.X - box.Size.X/2, pos.Y - box.Size.Y/2)
                box.Visible = true
                local r = getRole(p)
                box.Color = r == "Murderer" and Color3.new(1,0,0) or (r == "Sheriff" and Color3.new(0,0,1) or Color3.new(0,1,0))
            else box.Visible = false end
        else box.Visible = false if not p.Parent then box:Remove() c:Disconnect() end end
    end)
end
CreateToggle("Visuals", "Player ESP", "ESP")
for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then addESP(p) end end
Players.PlayerAdded:Connect(addESP)

-- Global
CreateButton("Global", "Infinite Yield", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
CreateButton("Global", "Server Hop", function()
    local s = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, v in pairs(s) do if v.id ~= game.JobId and v.playing < v.maxPlayers then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id) break end end
end)
CreateButton("Global", "Load R6 Animations", function() loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() end)
CreateButton("Global", "Load R15 Animations", function() loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))() end)

-- Key Logic
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "ensomg" then KeyFrame:Destroy() Main.Visible = true end
end)

-- Keybind
UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.LeftControl then Main.Visible = not Main.Visible end
end)

TabBtns["MM2"].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Tabs["MM2"].Visible = true
