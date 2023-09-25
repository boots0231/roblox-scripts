-- Define the brighter outline color and thickness
local outlineColor = BrickColor.new("Bright green") -- Replace with your desired BrickColor
local outlineThickness = 0.1 -- Adjust the thickness as needed

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

-- Function to create the outline effect and TextLabel for a player
local function createOutlineAndLabel(character)
    local outline = Instance.new("SelectionBox")
    outline.Name = "PlayerOutline"
    outline.Adornee = character
    outline.Color3 = outlineColor.Color
    outline.LineThickness = outlineThickness
    outline.Transparency = 0.5 -- You can adjust transparency as needed
    outline.Parent = character

    local label = Instance.new("BillboardGui")
    label.Name = "PlayerLabel"
    label.AlwaysOnTop = true
    label.Size = UDim2.new(2, 0, 0.3, 0) -- You can adjust the size as needed

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = player.Name -- Display the player's username
    text.TextColor3 = Color3.new(1, 1, 1) -- Text color
    text.TextSize = 14 -- Text size
    text.Font = Enum.Font.SourceSans
    text.Parent = label

    outline.Parent = character
    label.Parent = character
end

-- Function to remove the outline effect and TextLabel for a player
local function removeOutlineAndLabel(character)
    local outline = character:FindFirstChild("PlayerOutline")
    if outline then
        outline:Destroy()
    end

    local label = character:FindFirstChild("PlayerLabel")
    if label then
        label:Destroy()
    end
end

-- Listen for the player's character
player.CharacterAdded:Connect(function(character)
    createOutlineAndLabel(character)
end)

player.CharacterRemoving:Connect(function(character)
    removeOutlineAndLabel(character)
end)
