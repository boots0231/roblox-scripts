local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local CoreGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local mouseLocation = UserInputService:GetMouseLocation()
local BanGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("TextLabel")
local Time = Instance.new("TextLabel")
local TimeTextBox = Instance.new("TextBox")
local PlayerName = Instance.new("TextLabel")
local PlayerNameTextBox = Instance.new("TextBox")
local Reason = Instance.new("TextLabel")
local ReasonTextBox = Instance.new("TextBox")
local BanButton = Instance.new("TextButton")

function Notify(Message, Title)
    if Title == nil then Title = "Notification" end
    CoreGui:SetCore("SendNotification", {
        Title = Title;
        Text = Message;
        Duration = 20;
        Button1 = "Dismiss";
    })
end

function isHoveringOverObj(obj)
    local m = game.Players.LocalPlayer:GetMouse()
	local tx = obj.AbsolutePosition.X
	local ty = obj.AbsolutePosition.Y
	local bx = tx + obj.AbsoluteSize.X
	local by = ty + obj.AbsoluteSize.Y
	if m.X >= tx and m.Y >= ty and m.X <= bx and m.Y <= by then
		return true
	end
end

function AutoCompletePlayer(text) --this shit does not even work but i am far too lazy to rescript everything
    for i, plr in pairs(game:GetService("Players"):GetChildren()) do
        if plr.Name:sub(1,#text):lower() == text:gsub("	",""):lower() then
            return plr
        end
    end
    return {Name = text}
end



BanGui.Name = "BanGui"
BanGui.Parent = PlayerGui
BanGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = BanGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
MainFrame.BorderColor3 = Color3.fromRGB(50, 51, 54)
MainFrame.Position = UDim2.new(0, 300, 0, 300)
MainFrame.Size = UDim2.new(0, 250, 0, 220)

TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.AnchorPoint = Vector2.new(0, 1)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
TitleBar.BorderColor3 = Color3.fromRGB(50, 51, 54)
TitleBar.Size = UDim2.new(1, 0, 0, 19)
TitleBar.Font = Enum.Font.Ubuntu
TitleBar.Text = "Ban Menu"
TitleBar.TextColor3 = Color3.fromRGB(232, 232, 232)
TitleBar.TextSize = 16.000

Time.Name = "Time"
Time.Parent = MainFrame
Time.AnchorPoint = Vector2.new(0.5, 0)
Time.BackgroundColor3 = Color3.fromRGB(20, 22, 25)
Time.BorderColor3 = Color3.fromRGB(50, 51, 54)
Time.Position = UDim2.new(0.5, 0, 0, 39)
Time.Size = UDim2.new(1, -30, 0, 19)
Time.Font = Enum.Font.Ubuntu
Time.Text = ""
Time.TextColor3 = Color3.fromRGB(85, 85, 85)
Time.TextSize = 16.000
Time.TextXAlignment = Enum.TextXAlignment.Left

TimeTextBox.Name = "TimeTextBox"
TimeTextBox.Parent = Time
TimeTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TimeTextBox.BackgroundTransparency = 1.000
TimeTextBox.Size = UDim2.new(1, 0, 1, 0)
TimeTextBox.Font = Enum.Font.Ubuntu
TimeTextBox.Text = ""
TimeTextBox.TextColor3 = Color3.fromRGB(232, 232, 232)
TimeTextBox.PlaceholderColor3 = Color3.fromRGB(85, 85, 85)
TimeTextBox.TextSize = 16.000
TimeTextBox.TextXAlignment = Enum.TextXAlignment.Left
TimeTextBox.ClearTextOnFocus = false
TimeTextBox.PlaceholderText = "Time..."

PlayerName.Name = "PlayerName"
PlayerName.Parent = MainFrame
PlayerName.AnchorPoint = Vector2.new(0.5, 0)
PlayerName.BackgroundColor3 = Color3.fromRGB(20, 22, 25)
PlayerName.BorderColor3 = Color3.fromRGB(50, 51, 54)
PlayerName.Position = UDim2.new(0.5, 0, 0, 10)
PlayerName.Size = UDim2.new(1, -30, 0, 19)
PlayerName.Font = Enum.Font.Ubuntu
PlayerName.Text = "PlayerName"
PlayerName.TextColor3 = Color3.fromRGB(85, 85, 85)
PlayerName.TextSize = 16.000
PlayerName.TextXAlignment = Enum.TextXAlignment.Left

PlayerNameTextBox.Name = "PlayerNameTextBox"
PlayerNameTextBox.Parent = PlayerName
PlayerNameTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerNameTextBox.BackgroundTransparency = 1.000
PlayerNameTextBox.Size = UDim2.new(1, 0, 1, 0)
PlayerNameTextBox.Font = Enum.Font.Ubuntu
PlayerNameTextBox.Text = ""
PlayerNameTextBox.TextColor3 = Color3.fromRGB(232, 232, 232)
PlayerNameTextBox.TextSize = 16.000
PlayerNameTextBox.TextXAlignment = Enum.TextXAlignment.Left
PlayerNameTextBox.ClearTextOnFocus = false

Reason.Name = "Reason"
Reason.Parent = MainFrame
Reason.AnchorPoint = Vector2.new(0.5, 0)
Reason.BackgroundColor3 = Color3.fromRGB(20, 22, 25)
Reason.BorderColor3 = Color3.fromRGB(50, 51, 54)
Reason.Position = UDim2.new(0.5, 0, 0, 68)
Reason.Size = UDim2.new(1, -30, 0, 98)
Reason.Font = Enum.Font.Ubuntu
Reason.Text = "Reason"
Reason.TextColor3 = Color3.fromRGB(85, 85, 85)
Reason.TextSize = 16.000
Reason.TextXAlignment = Enum.TextXAlignment.Left
Reason.TextYAlignment = Enum.TextYAlignment.Top
Reason.TextWrapped = true
--why the fuck? just use placeholdertext
ReasonTextBox.Name = "ReasonTextBox"
ReasonTextBox.Parent = Reason
ReasonTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ReasonTextBox.BackgroundTransparency = 1.000
ReasonTextBox.Size = UDim2.new(1, 0, 1, 0)
ReasonTextBox.Font = Enum.Font.Ubuntu
ReasonTextBox.Text = ""
ReasonTextBox.TextColor3 = Color3.fromRGB(232, 232, 232)
ReasonTextBox.TextSize = 16.000
ReasonTextBox.TextXAlignment = Enum.TextXAlignment.Left
ReasonTextBox.TextYAlignment = Enum.TextYAlignment.Top
ReasonTextBox.ClearTextOnFocus = false

BanButton.Name = "BanButton"
BanButton.Parent = MainFrame
BanButton.AnchorPoint = Vector2.new(0.5, 0)
BanButton.BackgroundColor3 = Color3.fromRGB(20, 22, 25)
BanButton.TextColor3 = Color3.fromRGB(232, 232, 232)
BanButton.BorderColor3 = Color3.fromRGB(50, 51, 54)
BanButton.Position = UDim2.new(0.5, 0, 0, 177)
BanButton.Size = UDim2.new(1, -30, 0, 33)
BanButton.Font = Enum.Font.Ubuntu
BanButton.Text = "Ban"
BanButton.TextSize = 18.000

local BeingDragged = false
local DragOffset = Vector2.new(MainFrame.Position.X.Offset-mouseLocation.X, MainFrame.Position.Y.Offset-mouseLocation.Y)
local PlayersToBan = {}
local PlayersToBanNames = {}
local PlayersToBanNamesTextBox = {}
local segments = {1}
local TimeSuggestion = {}
local currentSegment = 1
function findAll(str, sub)
	local found = 0
	local positions = {}
	while found do
		found = found + 1
		found = str:find(sub, found)
		table.insert(positions, found)
	end
	return positions
end
function FindSegment(tbl, pos)
    local seg = 1
    for i, v in pairs(tbl) do
        if pos > v+2 then seg = i end
    end
    return seg
end
--[[UserInputService.InputBegan:connect(function(input)
    xpcall(function()
        if input.KeyCode == Enum.KeyCode.Menu then
            if UserInputService:GetFocusedTextBox() == PlayerNameTextBox then
                local len = #PlayersToBanNamesTextBox[currentSegment]
                PlayersToBanNamesTextBox[currentSegment] = AutoCompletePlayer(PlayersToBanNamesTextBox[currentSegment]).Name
                PlayersToBanNames[currentSegment] = AutoCompletePlayer(PlayersToBanNames[currentSegment]).Name
                PlayerName.Text = table.concat(PlayersToBanNames, ",")
                PlayerNameTextBox.Text = table.concat(PlayersToBanNamesTextBox, ",")
                PlayerNameTextBox.CursorPosition = PlayerNameTextBox.CursorPosition+(#PlayersToBanNamesTextBox[currentSegment]-len)
            end
        end
    end,warn)
end)]]
local lastpos = 1
PlayerNameTextBox:GetPropertyChangedSignal("CursorPosition"):Connect(function() 
    currentSegment = FindSegment(segments, PlayerNameTextBox.CursorPosition)
    print(currentSegment, #segments)
end)
PlayerNameTextBox:GetPropertyChangedSignal("Text"):Connect(function()
    if #PlayerNameTextBox.Text == 0 then
        PlayerName.Text = "PlayerName"
    else
        PlayersToBan = {}
        PlayersToBanNames = {}
        PlayersToBanNamesTextBox = {}
        segments = {1}
        for _, v in pairs(findAll(PlayerNameTextBox.Text, ",")) do
            table.insert( segments, v )
        end
        for i, v in pairs(string.split(PlayerNameTextBox.Text, ",")) do
            table.insert(PlayersToBan, AutoCompletePlayer(v))
            table.insert(PlayersToBanNames, AutoCompletePlayer(v).Name)
            table.insert(PlayersToBanNamesTextBox, v)
        end
        PlayerName.Text = table.concat(PlayersToBanNames, ",")
        if PlayerNameTextBox.Text:sub(#PlayerNameTextBox.Text) ~= "," then
            PlayerNameTextBox.Text = table.concat(PlayersToBanNamesTextBox, ",")
        end
    end
end)
local formulas = {
    types = {
        ['months'] = 60*60*24*30;
        ['weeks'] = 60*60*24*7;
        ['days'] = 60*60*24;
        ['hours'] = 60*60;
        ['minutes'] = 60;
        ['seconds'] = 1;
    };
    shortcuts = {
        ['mo'] = 'months';
        ['mths'] = 'months';
        ['month'] = 'months';
        ['w'] = 'weeks';
        ['week'] = 'weeks';
        ['ws'] = 'weeks';
        ['d'] = 'days';
        ['day'] = 'days';
        ['ds'] = 'days';
        ['h'] = 'hours';
        ['hs'] = 'hours';
        ['hour'] = 'hours';
        ['min'] = 'minutes';
        ['mins'] = 'minutes';
        ['minute'] = 'minutes';
        ['minutes'] = 'minutes';
        ['sec'] = 'seconds';
        ['secs'] = 'seconds';
        ['s'] = 'seconds';
        ['second'] = 'seconds';
    };
}

function ValidateTime(Time, Unit)
    if tonumber(Time) then
        for shortcut, stringfix in pairs (formulas.shortcuts) do
            if string.lower(Unit) == shortcut then
                return true
            end
        end
        for stringfix in pairs (formulas.types) do
            if string.lower(Unit) == stringfix then
                return true
            end
        end
    end
    return false
end
local Valid = true
local BanTime = ""
TimeTextBox:GetPropertyChangedSignal("Text"):Connect(function()
    local function UnGrayoutBanButton()
        TimeTextBox.TextColor3 = Color3.fromRGB(232, 232, 232)
        Valid = true
        BanButton.AutoButtonColor = true
        BanButton.BackgroundColor3 = Color3.fromRGB(20, 22, 25)
        BanButton.TextColor3 = Color3.fromRGB(232, 232, 232)
    end
    local function GrayoutBanButton()
        TimeTextBox.TextColor3 = Color3.fromRGB(212, 81, 72)
        Valid = false
        BanButton.AutoButtonColor = false
        BanButton.BackgroundColor3 = Color3.fromRGB(10, 12, 15)
        BanButton.TextColor3 = Color3.fromRGB(150, 150, 150)
    end
    if TimeTextBox.Text == "" or (function() if #TimeTextBox.Text:split(" ") == 2 then return ValidateTime(table.unpack(TimeTextBox.Text:split(" "))) else return false end end)() then
        BanTime = TimeTextBox.Text
        UnGrayoutBanButton()
    else
        GrayoutBanButton()
    end
end)
RunService.RenderStepped:connect(function()
	mouseLocation = UserInputService:GetMouseLocation()
    if BeingDragged then
        MainFrame.Position = UDim2.fromOffset(mouseLocation.X+DragOffset.X,mouseLocation.Y+DragOffset.Y)
    end
    if #ReasonTextBox.Text == 0 then
        Reason.Text = "Reason"
    else
        Reason.Text = ""
    end
end)
UserInputService.InputBegan:connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        DragOffset = Vector2.new(MainFrame.Position.X.Offset-mouseLocation.X, MainFrame.Position.Y.Offset-mouseLocation.Y)
        if isHoveringOverObj(TitleBar) then
            DragOffset = Vector2.new(MainFrame.Position.X.Offset-mouseLocation.X, MainFrame.Position.Y.Offset-mouseLocation.Y)
            BeingDragged = true
        end
    end
end)
UserInputService.InputEnded:connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        BeingDragged = false
    end
end)
local cache = {}
function getUserIdFromUsername(name)
	local player = Players:FindFirstChild(name)
	if player then
        cache[player.Name] = tostring(player.UserId)
		return tostring(player.UserId)
	end
    if cache then
        if cache[name] then
            return cache[name]
        end
    end
	-- If all else fails, send a request
	local id
	pcall(function()
		id = Players:GetUserIdFromNameAsync(name)
	end)
    if id then
        cache[name] = tostring(id)
        return tostring(id)
    else
        return
    end
end

local function PushBan(BanTbl)
    local Plr, Reason, Time, Data, Timestamp, Type = BanTbl.BannedUser, BanTbl.Reason, BanTbl.Time, BanTbl.Data, BanTbl.Timestamp, BanTbl.Type
    if typeof(Data) == "table" then Data = game:GetService("HttpService"):JSONEncode(Data) end
    if typeof(Plr) == "Instance" or typeof(Plr) == "table" then Plr = Plr.UserId end
    local Subst = {
        [" / "] = " ; "
    }
    for i, v in pairs(Subst) do
        Reason = Reason:gsub(i, v)
    end
    if Time and ValidateTime(table.unpack(Time:split(" "))) then
        if Timestamp then
            Reason = Reason.." / temp / "..Time.." / "..Timestamp
        else
            Reason = Reason.." / temp / "..Time.." / "..os.time()
        end
    elseif Time and Time:lower() == "unban" then
        Reason = Reason.." / unban / 0 minutes / 0" --
    else
        Reason = Reason.." / perm"
    end
    Reason = Reason.." / "..Data
    --This is what you are looking for most likely, fellow father clanner
    game:GetService("ReplicatedStorage").ConsoleSystem.RemoteFunction:InvokeServer("OverwriteBan",{baninfo = {tonumber(Plr),LocalPlayer.UserId,"perm",Reason},userid=tonumber(Plr)},"DataStore")
end

local function ProcessBan(Data)
    if not Data.Data then Data.Data = {} end
    if not Data.Type then Data.Type = "" end
    Data.Data.BanTime = os.time()
    Data.BanTime = os.time()
    assert(Data.BannedUser.Name, "This user does not exist!")
    assert(Data.BannedUser.UserId, "This user does not exist!")
    local Notification = "User "
    if Data.Time and Data.Time ~= "unban"  then
        local TempData = {}
        for i, v in pairs(Data) do
            TempData[i] = v
        end
        TempData.Time = nil
        TempData.Reason = "You have been temporarily banned for "..Data.Time..": "..Data.Reason
        Notification = Notification.." banned! Reason: \""..Data.Reason.."\"; Time: "..Data.Time
        PushBan(TempData)
        if Players:FindFirstChild(Data.BannedUser.Name) then
            repeat wait() until not Players:FindFirstChild(Data.BannedUser.Name)
        else
            wait(5)
        end
        PushBan(Data)
    else
        if Data.Time and Data.Time == "unban" then
            Notification = Notification.." unbanned!"
        elseif Data.Type and Data.Type:lower() == "exact" then
            Notification = Notification.." "..Data.Type.."-banned! Reason: \""..Data.Reason.."\""
        else
            Notification = Notification.." permanently banned! Reason:\""..Data.Reason.."\""
        end
        PushBan(Data)
    end
    Notify(Notification, Data.BannedUser.Name)
end

local WL = {
    "81625297",
    "1839885279",
    "176177672",
    "496694143",
    "95734865",
    "265719485",
    "301298470",
    "1388933167",
    "53869642",
    "137408641",
    "127819514",
    "2060702424",
    "105801822",
    "2040581251",
    "521162765",
    "139182643",
    "25650866",
    "673818091",
    "705025421",
    "72988554",
    "677913256",
    "1326665997",
    "1320366645",
    "52678856",
    "195483257",
    "3470397332",
    "704624005",
    "620121191",
    "130194477",
    "3378081848",
    "163051413",
    "4036928353",
    "3189329770",
    "25381139",
    "934608961",
    "1107245912",
    "1882189842",
    "664537181",
    "2418825660",
    "3240932150",
    "1236410006",
    "2354655621",
    "3125732637",
    "1705005739",
    "2853987366",
    "4546479235",
    "3316431861",
    "2822959481",
    "90985604",
    "1644621120",
    "3490824062",
    "3866503987",
    "4487449012",
    "4587750430",
    "3240937429",
    "47709879",
    "24356158",
    "5649175",
    "525651346",
    "984803992",
    "4430264357",
    "1451705048",
    "1493662379",
    "200396273",
    "512611899",
    "130194477",
    "222016268",
    "691976479",
    "2517368381",
    "3189329770",
    "3337355648",
    "3318056597",
    "4298777239"
} --once again, jank as fuck, not making another web server though

function BanUsers(Players, BanArray)
    for _, Player in pairs(Players) do
        assert(Player.Name, "This user does not exist!")
        assert(Player.UserId, "This user does not exist!")
        if table.find(WL, tostring(Player.UserId)) and Data.Time ~= "unban" then
            Notify("Player cannot be banned!", Player.Name)
            continue
        end
        local Ban = BanArray
        BanArray.BannedUser = Player
        ProcessBan(Ban)
        wait(3)
    end
end

BanButton.MouseButton1Down:Connect(function()
    if Valid then
        if BanTime == "" then BanTime = nil end
        local DataArray = {
            Reason = ReasonTextBox.Text,
            Time = BanTime
        }
        local ToBan = {}
        for i, v in pairs(PlayersToBanNames) do
            if Players:FindFirstChild(v) then
                table.insert(ToBan, Players:FindFirstChild(v))
            else
                table.insert(ToBan, {Name = v, UserId = getUserIdFromUsername(v)})
            end
        end
        BanUsers(ToBan,DataArray)
    end
end)
