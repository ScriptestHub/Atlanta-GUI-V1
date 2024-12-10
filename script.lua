local a = Instance.new("ScreenGui")
local b = Instance.new("Frame")
local c = Instance.new("TextButton")
local d = Instance.new("TextLabel")
local e = Instance.new("Frame")
local f = Instance.new("TextButton")
local g = Instance.new("TextButton")

local h = false
local i = false
local j, k, l, m

a.Name = "AtlantaGUI"
a.ResetOnSpawn = false
a.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

b.Parent = a
b.Size = UDim2.new(0, 450, 0, 350)
b.Position = UDim2.new(0.5, -225, 0.5, -175)
b.BackgroundColor3 = Color3.fromRGB(35, 39, 50)
b.BorderSizePixel = 0
b.Active = true

local n = Instance.new("UICorner")
n.Parent = b
n.CornerRadius = UDim.new(0, 15)

d.Parent = b
d.Size = UDim2.new(1, -50, 0, 40)
d.Position = UDim2.new(0, 25, 0, 5)
d.BackgroundTransparency = 1
d.Text = "Atlanta GUI V1"
d.TextColor3 = Color3.fromRGB(255, 255, 255)
d.Font = Enum.Font.GothamBold
d.TextSize = 24
d.TextXAlignment = Enum.TextXAlignment.Center

c.Parent = b
c.Size = UDim2.new(0, 30, 0, 30)
c.Position = UDim2.new(1, -35, 0, 5)
c.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
c.Text = "X"
c.TextColor3 = Color3.fromRGB(255, 255, 255)
c.TextScaled = true

local o = Instance.new("UICorner")
o.Parent = c
o.CornerRadius = UDim.new(0, 8)

e.Parent = b
e.Size = UDim2.new(1, -10, 1, -60)
e.Position = UDim2.new(0, 5, 0, 50)
e.BackgroundColor3 = Color3.fromRGB(50, 55, 65)

local p = Instance.new("UICorner")
p.Parent = e
p.CornerRadius = UDim.new(0, 8)

f.Parent = e
f.Size = UDim2.new(0, 150, 0, 50)
f.Position = UDim2.new(0.5, -75, 0.2, 0)
f.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
f.Text = "Infinite Jump: OFF"
f.TextColor3 = Color3.fromRGB(255, 255, 255)
f.TextScaled = true

local q = Instance.new("UICorner")
q.Parent = f
q.CornerRadius = UDim.new(0, 8)

g.Parent = e
g.Size = UDim2.new(0, 150, 0, 50)
g.Position = UDim2.new(0.5, -75, 0.5, 0)
g.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
g.Text = "ESP: OFF"
g.TextColor3 = Color3.fromRGB(255, 255, 255)
g.TextScaled = true

local r = Instance.new("UICorner")
r.Parent = g
r.CornerRadius = UDim.new(0, 8)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if h then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

f.MouseButton1Click:Connect(function()
    h = not h
    f.BackgroundColor3 = h and Color3.fromRGB(70, 200, 90) or Color3.fromRGB(200, 70, 70)
    f.Text = h and "Infinite Jump: ON" or "Infinite Jump: OFF"
end)

local s = function(t)
    if not t.Character or i == false then return end
    local u = Instance.new("Highlight")
    u.Adornee = t.Character
    u.Parent = t.Character
end

local v = function(t)
    if t.Character and t.Character:FindFirstChild("Highlight") then
        t.Character:FindFirstChild("Highlight"):Destroy()
    end
end

g.MouseButton1Click:Connect(function()
    i = not i
    g.BackgroundColor3 = i and Color3.fromRGB(70, 200, 90) or Color3.fromRGB(200, 70, 70)
    g.Text = i and "ESP: ON" or "ESP: OFF"
    for _, w in ipairs(game.Players:GetPlayers()) do
        if i then
            s(w)
        else
            v(w)
        end
    end
end)

game.Players.PlayerAdded:Connect(function(x)
    x.CharacterAdded:Connect(function()
        if i then s(x) end
    end)
end)

game.Players.PlayerRemoving:Connect(function(x)
    v(x)
end)

b.InputBegan:Connect(function(y)
    if y.UserInputType == Enum.UserInputType.MouseButton1 then
        j = true
        l = y.Position
        m = b.Position
    end
end)

b.InputChanged:Connect(function(y)
    if y.UserInputType == Enum.UserInputType.MouseMovement then
        k = y
    end
end)

b.InputEnded:Connect(function(y)
    if y.UserInputType == Enum.UserInputType.MouseButton1 then
        j = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(y)
    if y == k and j then
        local n = y.Position - l
        b.Position = UDim2.new(m.X.Scale, m.X.Offset + n.X, m.Y.Scale, m.Y.Offset + n.Y)
    end
end)

c.MouseButton1Click:Connect(function()
    a:Destroy()
end)
