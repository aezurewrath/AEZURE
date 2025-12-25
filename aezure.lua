--[[                                                                                  
                                                                                                    
                                                                                                ÆÆÆÆ
                                                                                           ÆÆÆÆÆÆÆÆÆ
                                                                                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ
                                                                                 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ 
                                                                                 ÆÆÆÆÆÆÆÆÆ    ÆÆÆÆÆ 
                                                                                 ÆÆÆÆ        ÆÆÆÆÆÆ 
                                                                                             ÆÆÆÆÆ  
                                                ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ   ÆÆÆÆÆ  
                                               ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆÆ  
                                             ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆ   
                                            ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆ   
                                           ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ          
                                          ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ          
                                         ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                        ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                      ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                    ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                ÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                               ÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                              ÆÆÆÆÆÆÆÆÆÆÆÆ   ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                             ÆÆÆÆÆÆÆÆÆÆÆ     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                            ÆÆÆÆÆÆÆÆÆÆÆ       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                           ÆÆÆÆÆÆÆÆÆÆÆ        ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                          ÆÆÆÆÆÆÆÆÆÆÆ         ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                         ÆÆÆÆÆÆÆÆÆÆÆ          ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                      ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                    ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                   ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                  ÆÆÆÆÆÆÆÆÆÆÆÆ                ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                 ÆÆÆÆÆÆÆÆÆÆÆÆ                 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                ÆÆÆÆÆÆÆÆÆÆÆÆ                  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
     ÆÆÆÆÆ     ÆÆÆÆÆÆÆÆÆÆÆÆ                   ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
     ÆÆÆÆÆ    ÆÆÆÆÆÆÆÆÆÆÆÆ                    ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
    ÆÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆ                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
    ÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆ                       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
   ÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆ                        ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
  ÆÆÆÆÆÆ                                                                                            
  ÆÆÆÆÆ     ÆÆÆÆÆÆÆÆ                                                                                
 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                                                                
 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                                                                
ÆÆÆÆÆÆÆÆÆÆÆÆ                                                                                        
                                                                                                   
                                                                                                    
]]





















local players = game:GetService("Players")
local plr = players.LocalPlayer
local core = game:GetService("CoreGui").RobloxGui
local uis = game:GetService("UserInputService")
local teleports = game:GetService("TeleportService")
local repstore = game:GetService("ReplicatedStorage")
local httpservice = game:GetService("HttpService")
local tweens = game:GetService("TweenService")
local runsrv = game:GetService("RunService")
local chat = game:GetService("Chat")
local ss = game:GetService("SoundService")
local cas = game:GetService("ContextActionService")
local stui = game:GetService("StarterGui")
local tcs = game:GetService("TextChatService")
local isLegacyChat = tcs.ChatVersion == Enum.ChatVersion.LegacyChatService
local clogCount = 1
local prefix = Enum.KeyCode.Equals
local ping = nil
local shouldbe = Vector3.new(0,0,0)
local binding = false
local activeSlabel = nil
local uvrslV = {}
local sttngsL = {}

local canwrite = false
local canread = false


local genv = getgenv() or _G

if not genv.AEtakeName then
	genv.AEtakeName = false
end

if not genv.AEparent then
	genv.AEparent = core
end

print(genv.AEparent)
print(genv.AEtakeName)


function notify(title,text,duration)

	stui:SetCore("SendNotification", {
		Title = title or "", 
		Text = text or "",
		Duration = duration or 5
	})
end



local writefile = type(writefile) == "function" and function(file, data, safe)
	if safe == true then return pcall(writefile, file, data) end
	writefile(file, data)
end

local readfile = type(readfile) == "function" and function(file, safe)
	if safe == true then return pcall(readfile, file) end
	return readfile(file)
end


if writefile then
	canwrite = true
else
	notify("⚠️IMPORTANT⚠️", "Your executor can't write files. Your settings and keybinds will not save.", 10)
end

if readfile then
	canread = true
end


function saveData(data)
	if canwrite then
		writefile("data.ae", httpservice:JSONEncode(data), true)
		return true
	end 
end



function loadData()
	if canread then
		return httpservice:JSONDecode(readfile("data.ae", true))
	end
end


local dataloaded, data_ = readfile("data.ae", true)
local data = nil
if dataloaded then
	data = httpservice:JSONDecode(data_)
end

local function rName()
	if not genv.AEtakeName then
		return string.rep(string.char(math.random(1,128)), math.random(1,25))
	else
		local x = nil
		for i, v in pairs(genv.AEparent:GetChildren()) do
			x = v
			break
		end
		if x then
			return x.Name
		else
			return string.rep(string.char(math.random(1,128)), math.random(1,25))
		end
	end
end


local function getPlayer(str)
	local foundPlayer = nil
	for i, v in pairs(players:GetPlayers()) do
		local a = string.sub(string.lower(v.Name),1,string.len(string.lower(str)))
		if string.match(string.lower(a), string.lower(str)) then
			foundPlayer = v
			break
		end
	end
	return foundPlayer
end

local function getChild(parent, name)
	if parent and name then
		for i, v in pairs(parent:GetChildren()) do
			if v:GetAttribute("AEname") and v:GetAttribute("AEname") == tostring(name) then
				return v
			end
		end
	end
end

local function getDescendant(parent, name)
	if parent and name then
		for i, v in pairs(parent:GetDescendants()) do
			if v:GetAttribute("AEname") and v:GetAttribute("AEname") == tostring(name) then
				return v
			end
		end
	end
end

local function findFirstChild(parent, name)
	if parent and name then
		for i, v in pairs(parent:GetChildren()) do
			if v:GetAttribue(name) then
				return v
			end
		end
	end
end

local function setName(x, name)
	if x then
		x:SetAttribute("AEname", tostring(name))
	end
end

local function getName(x)
	if x:GetAttribute("AEname") then
		return x:GetAttribute("AEname")
	end
end

local function getLinesForBoundingBox(size)
	local x = size.X / 2
	local y = size.Y / 2
	local z = size.Z / 2
	return {
		Vector3.new(x, y, z),
		Vector3.new(x, -y, z),
		Vector3.new(x, y, z),
		Vector3.new(-x, y, z),
		Vector3.new(x, y, z),
		Vector3.new(x, y, -z),
		Vector3.new(-x,y,-z),
		Vector3.new(x, y, -z),
		Vector3.new(-x,y,-z),
		Vector3.new(-x,y,z),
		Vector3.new(-x,y,-z),
		Vector3.new(-x,-y,-z),
		Vector3.new(x, -y, -z),
		Vector3.new(x, -y, z),
		Vector3.new(x, -y, -z),
		Vector3.new(-x, -y, -z),
		Vector3.new(x, -y, -z),
		Vector3.new(x, y, -z),
		Vector3.new(-x, -y, z),
		Vector3.new(-x, -y, -z),
		Vector3.new(-x, -y, z),
		Vector3.new(-x, y, z),
		Vector3.new(-x, -y, z),
		Vector3.new(x, -y, z),
	}
end

local colors = {
	darkest = Color3.fromRGB(9,9,21),
	azure = Color3.fromRGB(138,249,255),
	white = Color3.fromRGB(255,255,255),
	black = Color3.fromRGB(0,0,0),
	light = Color3.fromRGB(29, 28, 42),
	red = Color3.fromRGB(255, 65, 68),
	lightest = Color3.fromRGB(75,79,154),
	bright = Color3.fromRGB(48,51,98),

}

-- UDim2.new(0,0,0.79,0)

local aeLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/aezurewrath/AEZURE/refs/heads/main/aezurelib.lua"))()



local function disconnectTable(x)
	for i, v in pairs(x) do
		v:Disconnect()
	end
end

local function kc(x)
	local kp = {
		["Enum.KeyCode.A"] = Enum.KeyCode.A,
		["Enum.KeyCode.B"] = Enum.KeyCode.B,
		["Enum.KeyCode.C"] = Enum.KeyCode.C,
		["Enum.KeyCode.D"] = Enum.KeyCode.D,
		["Enum.KeyCode.E"] = Enum.KeyCode.E,
		["Enum.KeyCode.F"] = Enum.KeyCode.F,
		["Enum.KeyCode.G"] = Enum.KeyCode.G,
		["Enum.KeyCode.H"] = Enum.KeyCode.H,
		["Enum.KeyCode.I"] = Enum.KeyCode.I,
		["Enum.KeyCode.J"] = Enum.KeyCode.J,
		["Enum.KeyCode.K"] = Enum.KeyCode.K,
		["Enum.KeyCode.L"] = Enum.KeyCode.L,
		["Enum.KeyCode.M"] = Enum.KeyCode.M,
		["Enum.KeyCode.N"] = Enum.KeyCode.N,
		["Enum.KeyCode.O"] = Enum.KeyCode.O,
		["Enum.KeyCode.P"] = Enum.KeyCode.P,
		["Enum.KeyCode.Q"] = Enum.KeyCode.Q,
		["Enum.KeyCode.R"] = Enum.KeyCode.R,
		["Enum.KeyCode.S"] = Enum.KeyCode.S,
		["Enum.KeyCode.T"] = Enum.KeyCode.T,
		["Enum.KeyCode.U"] = Enum.KeyCode.U,
		["Enum.KeyCode.V"] = Enum.KeyCode.V,
		["Enum.KeyCode.W"] = Enum.KeyCode.W,
		["Enum.KeyCode.X"] = Enum.KeyCode.X,
		["Enum.KeyCode.Y"] = Enum.KeyCode.Y,
		["Enum.KeyCode.Z"] = Enum.KeyCode.Z,
		["Enum.KeyCode.Zero"] = Enum.KeyCode.Zero,
		["Enum.KeyCode.One"] = Enum.KeyCode.One,
		["Enum.KeyCode.Two"] = Enum.KeyCode.Two,
		["Enum.KeyCode.Three"] = Enum.KeyCode.Three,
		["Enum.KeyCode.Four"] = Enum.KeyCode.Four,
		["Enum.KeyCode.Five"] = Enum.KeyCode.Five,
		["Enum.KeyCode.Six"] = Enum.KeyCode.Six,
		["Enum.KeyCode.Seven"] = Enum.KeyCode.Seven,
		["Enum.KeyCode.Eight"] = Enum.KeyCode.Eight,
		["Enum.KeyCode.Nine"] = Enum.KeyCode.Nine,
		["Enum.KeyCode.LeftShift"] = Enum.KeyCode.LeftShift,
		["Enum.KeyCode.RightShift"] = Enum.KeyCode.RightShift,
		["Enum.KeyCode.LeftControl"] = Enum.KeyCode.LeftControl,
		["Enum.KeyCode.RightControl"] = Enum.KeyCode.RightControl,
		["Enum.KeyCode.LeftAlt"] = Enum.KeyCode.LeftAlt,
		["Enum.KeyCode.RightAlt"] = Enum.KeyCode.RightAlt,
		["Enum.KeyCode.Equals"] = Enum.KeyCode.Equals,
		["Enum.KeyCode.Backquote"] = Enum.KeyCode.Backquote,
		["Enum.KeyCode.Slash"] = Enum.KeyCode.Slash,
		["Enum.KeyCode.LeftBracket"] = Enum.KeyCode.LeftBracket,
		["Enum.KeyCode.RightBracket"] = Enum.KeyCode.RightBracket,
		["Enum.KeyCode.Minus"] = Enum.KeyCode.Minus,
		["Enum.KeyCode.Semicolon"] = Enum.KeyCode.Semicolon,
		["Enum.KeyCode.Quote"] = Enum.KeyCode.Quote,
		["Enum.KeyCode.Period"] = Enum.KeyCode.Period,
		["Enum.KeyCode.Comma"] = Enum.KeyCode.Comma,
		["Enum.KeyCode.F1"] = Enum.KeyCode.F1,
		["Enum.KeyCode.F2"] = Enum.KeyCode.F2,
		["Enum.KeyCode.F3"] = Enum.KeyCode.F3,
		["Enum.KeyCode.F4"] = Enum.KeyCode.F4,
		["Enum.KeyCode.F5"] = Enum.KeyCode.F5,
		["Enum.KeyCode.F6"] = Enum.KeyCode.F6,
		["Enum.KeyCode.F7"] = Enum.KeyCode.F7,
		["Enum.KeyCode.F8"] = Enum.KeyCode.F8,
		["Enum.KeyCode.F9"] = Enum.KeyCode.F9,
		["Enum.KeyCode.F10"] = Enum.KeyCode.F10,
		["Enum.KeyCode.F11"] = Enum.KeyCode.F11,
		["Enum.KeyCode.F12"] = Enum.KeyCode.F12
	}


	return kp[x]

end

local alreadyrunning = false
for i, v in pairs(core:GetChildren()) do
	if v:HasTag("abcdefg") then
		alreadyrunning = true
		break
	end
end

scrName = rName()

local function checkTrue(x)
	local truevalues = {"true", "yes", "t", "y"}
	if table.find(truevalues, string.lower(x)) then
		return true
	else
		return false
	end
end

local function getPlayerNames()
	local x = {}
	for i, v in pairs(players:GetPlayers()) do
		table.insert(x, v.Name)
	end
	return x
end

local function checkCommandTarget(x)
	warn("check Command Target", x)
	if x then
		x = string.lower(x)
		warn("check Command Target 'x' is present")
		if string.match(x, "all") then
			warn("check Command Target  all")
			return getPlayerNames()
		elseif string.match(x, "others") then
			warn("check Command Target  others")
			local t = getPlayerNames()
			table.remove(t, table.find(t, plr.Name))
			return t
		elseif string.match(x, "random") then
			warn("check Command Target  random")
			local random = math.random(1, #getPlayerNames())
			local allbutself = getPlayerNames()
			table.remove(allbutself, table.find(allbutself, plr.Name))
			for i, v in pairs(allbutself) do
				if i == random then
					return {v}
				end
			end
		end
	end
end

if not core:FindFirstChild(scrName) and not alreadyrunning then

	chat.Chatted:Connect(function(p, m, c)
		if string.split(m, " ")[1] and string.split(m, " ")[2] then
			local temp = string.split(m, " ")
			local player = getPlayer(temp[2])
			if not player then return end
			if string.match(temp[1], "unview") then
				if player == plr then
					notify(p.Name.." unviewed you", "You are no longer being viewed by a moderator.", 5)
				end
			elseif string.match(temp[1], "view") or string.match(temp[1], "kill") or string.match(temp[1], "bring") or string.match(temp[1], "to") or string.match(temp[1], "load") or string.match(temp[1], "refresh") then
				if player == plr then
					notify(p.Name.." mentioned you!", m, 10)
				end
			end
		end
	end)






	local scr = Instance.new("ScreenGui", genv.AEparent)
	scr.Name = rName()
	scr.ResetOnSpawn = false
	scr:AddTag("abcdefg")



	--[[-----------------------------------COMMAND LINE-----------------------------------]]--
	
	local commandlineMain = aeLib.CommandLine(scr)
	local cmdBar : TextBox = commandlineMain.CommandBar
	commandlineMain.Predictions.Visible = false
	
	local cmdbaropentween = tweens:Create(commandlineMain.Main, TweenInfo.new(.2, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5,0,0.94,0)})
	local hidebarcmd = tweens:Create(commandlineMain.CommandIndicator, TweenInfo.new(.2, Enum.EasingStyle.Quad), {BackgroundTransparency = 1})
	local cmdbarclosetween = tweens:Create(commandlineMain.Main, TweenInfo.new(.2, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5,0,1.02,0)})
	local showbarcmd = tweens:Create(commandlineMain.CommandIndicator, TweenInfo.new(.2, Enum.EasingStyle.Quad), {BackgroundTransparency = .3})
	
	local function openCmdLine()
		cmdbaropentween:Play()
		hidebarcmd:Play()
	end
	
	local function closeCmdLine()
		cmdbarclosetween:Play()
		showbarcmd:Play()
		commandlineMain.Predictions.Visible = false
	end
	
	commandlineMain.Main:GetPropertyChangedSignal("GuiState"):Connect(function()
		if commandlineMain.Main.GuiState == Enum.GuiState.Hover then
			openCmdLine()
		elseif commandlineMain.Main.GuiState == Enum.GuiState.Idle and not cmdBar:IsFocused() then
			closeCmdLine()
		elseif commandlineMain.Main.GuiState == Enum.GuiState.Press and not cmdBar:IsFocused() then
			openCmdLine()
			cmdBar:CaptureFocus()
		end
	end)
	
	

	--[[-----------------------------------COMMAND LINE-----------------------------------]]--

	--[[-----------------------------------COMMAND LIST-----------------------------------]]--

	local commandList, commandListConnections, commandListFunctions = aeLib.ListWindow(scr, "COMMANDS")

	local mousefollow = aeLib.TitleWindowDescription(scr, "", "")

	function updatemousefollower(title, text, active)
		if not title and text then return end

		if active then
			task.wait(.05)
			mousefollow.Main.Visible = true
		else
			mousefollow.Main.Visible = false
		end

		mousefollow._Title.Text = title
		mousefollow._Info.Text = text

	end

	plr:GetMouse().Move:Connect(function()
		local mousepos = uis:GetMouseLocation()

		mousefollow.Main.Position = UDim2.new(0, mousepos.X, 0, mousepos.Y - 50)
		if commandList._List.GuiState ~= Enum.GuiState.Hover and commandList._List.GuiState ~= Enum.GuiState.Press then
			updatemousefollower(" ", " ", false)
		end
	end)

	--[[-----------------------------------COMMAND LIST-----------------------------------]]--


	--[[-----------------------------------SAVEDATA-----------------------------------]]--
	local _settings = {
		Prefix = Enum.KeyCode.Semicolon,
		["Mention Notifier"] = false,

	}

	local settingtypes = {
		Prefix = "keybind",
		["Mention Notifier"] = "boolean",

	}

	local keybinds = {}
	local keybindsStates = {}


	local function gettype(x)
		return settingtypes[x]
	end

	local function destringify(x)
		if type(x) == "string" then
			if string.find(string.lower(x), "enum") then
				return kc(x)
			end
		end
	end


	if dataloaded then

		for i, v in pairs(data.settings) do
			if _settings[i] then
				_settings[i] = v
			end
		end

		for i, v in pairs(_settings) do
			local x = destringify(v)
			if x then
				_settings[i] = x
			end
		end

		for i, v in pairs(data.keybinds) do
			local x = {}
			x.keybind = destringify(v.keybind)
			x.command = v.command
			x.command2 = v.command2
			x.toggle = v.toggle

			table.insert(keybinds, x)
			table.insert(keybindsStates, false)
		end



	end

	local function returnsavedata()
		local tmp = {}
		local tmp1 = {}
		local tmp2 = {}

		for i, v in pairs(_settings) do
			local append = v
			if type(v) == "userdata" then
				append = tostring(v)
			end
			tmp1[i] = append
		end

		for i, v in pairs(keybinds) do
			local tmp3 = {}
			for z, item in pairs(v) do
				local append = item
				if type(item) == "userdata" then
					append = tostring(item)
				end
				tmp3[z] = append
			end
			table.insert(tmp2, tmp3)
		end

		tmp.settings = tmp1
		tmp.keybinds = tmp2

		return tmp
	end

	--[[-----------------------------------SAVEDATA-----------------------------------]]--

	--[[-----------------------------------SETTINGS-----------------------------------]]--





	local settingsMenu, settingsMenuConnections, settingsMenuFunctions = aeLib.ListWindow(scr, "SETTINGS")
	

	print("yes")

	for i, v in pairs(_settings) do
		print("Loop".. i)
		local _type = gettype(i)
		local btext = nil
		local cback = nil
		local cback2 = nil

		if _type then
			print("yeess")
			if _type == "keybind" then

				btext = tostring(v.Name)

				cback = function()
					binding = true
					activeSlabel = tostring(i)
					sttngsL[activeSlabel]._Button.Text = "..."
				end

			elseif _type == "boolean" then

				if v == true then
					btext = "active"
				elseif v == false then
					btext = "inactive"
				end

				uvrslV[i] = v

				cback = function()

					if _settings[i] == true then
						if sttngsL[i] then
							sttngsL[i]._Button.Text = "inactive"
							_settings[i] = false
						end
					elseif _settings[i] == false then
						if sttngsL[i] then
							sttngsL[i]._Button.Text = "active"
							_settings[i] = true
						end
					end

					local newData = returnsavedata() 
					saveData(newData)

				end

			end

		end



		local created = aeLib.ListLabelOneButton(settingsMenu._List, tostring(i), btext, cback, cback2)
		sttngsL[tostring(i)] = created
	end

	--[[-----------------------------------SETTINGS-----------------------------------]]--

	--[[-----------------------------------KEYBINDS-----------------------------------]]--

	local keybindMenu, keybindMenuConnections, keybindMenuFunctions = aeLib.ListWindowContentAbove(scr, "KEYBINDS")
	
	


	for i, v in pairs(keybinds) do
		local x
		x = aeLib.ListLabelOneButton(keybindMenu._List, "> ".. tostring(v.command).. " [".. tostring(v.keybind).. "]", "UNBIND", function()
			x.Main:Destroy()
			local z = table.find(keybinds, v)
			if z then
				table.remove(keybinds, z)
				table.remove(keybindsStates, z)
			end
			saveData(returnsavedata())
		end)
	end


	local kbinding = false
	local kbindselect = nil
	local kbindtoggle = false
	
	
	local cmdInput1b = aeLib.EmptyField(keybindMenu._ContentFrame, "COMMAND 1")
	local cmdInput2b = aeLib.EmptyField(keybindMenu._ContentFrame, "COMMAND 2")
	local cmdInput1 = cmdInput1b.Main
	cmdInput1.Position = UDim2.new(0,0,0.01,0)
	local cmdInput2 = cmdInput2b.Main
	cmdInput2.Position = UDim2.new(0,0,0.3,0)
	
	local setbindbutton = aeLib.EmptyButton(keybindMenu._ContentFrame, "SET BIND", function()
		kbinding = true
	end)
	
	setbindbutton.Main.Position = UDim2.new(0, 0, 0.59,0)
	setbindbutton.Main.Size = UDim2.new(0.3,0,0.225,0)
	
	
	local setbindtogglebutton = nil
	
	setbindtogglebutton = aeLib.EmptyButton(keybindMenu._ContentFrame, "TOGGLE [INACTIVE]", function()
		if not kbindtoggle then
			kbindtoggle = true
			setbindtogglebutton.Main.Text = "TOGGLE [ACTIVE]"
		else
			kbindtoggle = false
			setbindtogglebutton.Main.Text = "TOGGLE [INACTIVE]"
		end
	end)
	
	setbindtogglebutton.Main.Position = UDim2.new(0.7,0,0.59,0)
	setbindtogglebutton.Main.Size = UDim2.new(0.3,0,0.225,0)
	
	local addbindbutton = nil
	
	addbindbutton = aeLib.EmptyButton(keybindMenu._ContentFrame, "ADD BIND", function()
		if not kbinding and kbindselect then
			local tmp = {}
			if kbindtoggle and cmdInput1.Text ~= "" and cmdInput2.Text ~= "" then
				tmp.keybind = kbindselect
				tmp.command = cmdInput1.Text
				tmp.command2 = cmdInput2.Text
				tmp.toggle = true
				table.insert(keybindsStates, false)
			elseif not kbindtoggle and cmdInput1.Text ~= "" then
				tmp.keybind = kbindselect
				tmp.command = cmdInput1.Text
				tmp.command2 = "."
				tmp.toggle = false
				table.insert(keybindsStates, false)
			end

			table.insert(keybinds, tmp)

			local createdLabel = nil
			createdLabel = aeLib.ListLabelOneButton(keybindMenu._List, "> ".. tostring(cmdInput1.Text) .." [".. tostring(kbindselect) .."]", "UNBIND", function()
				createdLabel.Main:Destroy()
				local x = table.find(keybinds, tmp)
				if x then
					table.remove(keybinds, x)
					table.remove(keybindsStates, x)
				end
				saveData(returnsavedata())
			end)

			setbindbutton.Main.Text = "SET BIND"
			kbindselect = nil

			saveData(returnsavedata())

		end
	end)
	
	addbindbutton.Main.Position = UDim2.new(0.349, 0, 0.59, 0)
	addbindbutton.Main.Size = UDim2.new(0.3,0,0.225,0)


	--[[-----------------------------------KEYBINDS-----------------------------------]]--


	

	local cmds = {}

	
	local currentplugin = nil
	local function addCommand(name: string, aliases, description, args, cback)
		if not description then
			description = "None"
		end

		local temp = {}
		for i, v in pairs(args) do
			table.insert(temp, string.lower(v))
		end

		temp = args
		
		if currentplugin then
			name = `{currentplugin}:{name}`
		end
		
		warn("---------ADD COMMAND---------")
		print(name)
		print(table.concat(aliases, ", "))
		print(description)
		print(table.concat(args, ", "))
		print(cback ~= nil)


		table.insert(aliases, string.lower(name))
		local tmp = {}
		table.insert(tmp, "description")
		table.insert(tmp, "aliases")
		table.insert(tmp, "args")
		table.insert(tmp, "callback")
		tmp["description"] = description
		tmp["aliases"] = aliases
		tmp["args"] = args
		tmp["callback"] = cback

		cmds[name] = tmp

	end


	local function decompile(str)
		return string.split(str, " ")
	end

	local function runCmd(cmd)
		local decompiled = decompile(cmd)
		print(decompiled)
		local command = decompiled[1]
		command = string.lower(command)
		local givenArgs = decompiled
		table.remove(givenArgs, 1)
		local toRun = nil
		local toRunP = nil
		
		warn("---RUNCMD---")
		print(cmd)
		warn("---RUNCMD---")



		for i, v in pairs(cmds) do
			for x, c in pairs(v["aliases"]) do
				if c == command then
					if type(i) == "string" then
						toRun = i
						toRunP = v
						break
					end
				end
			end
			if toRun then
				break
			end
		end




		if toRun then
			
			for i, v in pairs(givenArgs) do
				if toRunP.args ~= "path" and toRunP.args ~= "parent" then
					givenArgs[i] = string.lower(v)
				end
			end
			
			
			
			local plrAsArg = table.find(toRunP.args, "player")
			if plrAsArg then
				if string.lower(tostring(givenArgs[plrAsArg])) == "all" then
					for i, v in pairs(getPlayerNames()) do
						print(v)
						local newArgs = givenArgs
						table.remove(givenArgs, plrAsArg)
						table.insert(newArgs, plrAsArg, v)
						toRunP.callback(newArgs)
						wait(.05)
					end
				elseif string.lower(tostring(givenArgs[plrAsArg])) == "others" then
					for i, v in pairs(getPlayerNames()) do
						if v ~= plr.Name then
							print(v)
							local newArgs = givenArgs
							table.remove(givenArgs, plrAsArg)
							table.insert(newArgs, plrAsArg, v)
							toRunP.callback(newArgs)
						end
						wait(.05)
					end
				elseif string.lower(tostring(givenArgs[plrAsArg])) == "random" then
					local random = math.random(1, #getPlayerNames())
					local allbutself = getPlayerNames()
					table.remove(allbutself, table.find(allbutself, plr.Name))
					for i, v in pairs(allbutself) do
						if i == random then
							print(v)
							local newArgs = givenArgs
							table.remove(givenArgs, plrAsArg)
							table.insert(newArgs, plrAsArg, v)
							toRunP.callback(newArgs)
						end
					end
				else
					toRunP.callback(givenArgs)
				end
			else
				toRunP.callback(givenArgs)
			end

		end

	end



	local wpressed = false
	local bricK = uis.InputBegan:Connect(function(inp, e)
		if not e then
			if inp.KeyCode == Enum.KeyCode.W or inp.KeyCode == Enum.KeyCode.S then
				wpressed = true
			end
		end
	end)

	local briCk = uis.InputEnded:Connect(function(inp, e)
		if not e then
			if inp.KeyCode == Enum.KeyCode.W or inp.KeyCode == Enum.KeyCode.S then
				wpressed = false
			end
		end
	end)

	local platform = nil
	local platformC = nil
	addCommand("hipheight", {"hh", "hip"}, "Set your character's hipheight to [value] ", {"value"}, function(a)
		if a[1] then
			local value = tonumber(a[1])
			if value and plr.Character then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
				if h then
					h.HipHeight = value
				end
			end
		end
	end)
	
	addCommand("debug:test", {}, "mango", {}, function(a)
		print("something")
	end)

	addCommand("debugtest1", {}, nil, {}, function(a)
		warn("v--debug test 1 results--v")
		print(type(players:GetChildren()))
		print(table.concat(players:GetChildren(), ", "))
		warn("^--debug test 1 results--^")
	end)

	addCommand("debugtest2", {}, nil, {}, function(a)
		warn("v--debug test 2 results--v")
		print(table.concat({"Ohio", "Sigma", "Man"}, ",", 1))
		warn("^--debug test 2 results--^")
	end)



	addCommand("debugtest3", {}, nil, {}, function(a)
		warn("v--debug test 3 results--v")
		print(table.concat(getPlayerNames(), ",", 1))
		warn("^--debug test 3 results--^")
	end)

	addCommand("debugtest4", {}, nil, {}, function(a)
		local x = getPlayerNames()
		warn("v--debug test 4 results--v")
		print(table.concat(x, ",", 1))
		for i, v in pairs(players:GetPlayers()) do
			warn("------------------------------------------")
			local player = getPlayer(v.Name)
			if player then
				print("player instance for ".. v.Name.. " found")
				if player.Character then
					print("character for ".. v.Name.. " found")
					if player.Character.PrimaryPart then
						print("found primary part for character of ".. v.Name)
					end
				end
			end
		end
		warn("^--debug test 4 results--^")
	end)

	addCommand("printnames", {}, "print all names", {"player"}, function(a)
		if a and a[1] then
			local plaaayerr = getPlayer(a[1])
			if plaaayerr then
				print(plaaayerr.Name)
			end
		end
	end)

	addCommand("walkspeed", {"ws", "wspeed"}, "Set your character's walkspeed to [value] ", {"value"}, function(a)
		if a[1] then
			local value = tonumber(a[1])
			if value then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

				if h then
					h.WalkSpeed = value
				end
			end
		end
	end)


	--[[
	addCommand("chatlogs", {"clogs"}, "Open the chatlogs", {}, function(a)
		openCLog:Play()
	end)
]]

	addCommand("infiniteyield", {"iy", "infy", "infyield"}, "open infinite yield", {}, function(a)
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
	local cwalk = nil
	local cwalkRun = false
	local cwalkdisableondeath = false
	local cwalkrunning = false
	local seatbindcwalk = nil

	addCommand("settings", {}, "open settings menu", {}, function(a)
		settingsMenuFunctions.Open()
	end)

	addCommand("keybinds", {"binds"}, "open keybinding menu", {}, function(a)
		keybindMenuFunctions.Open()
	end)

	addCommand("commands", {"cmds"}, nil, {}, function(a)
		commandListFunctions.Open()
	end)

	addCommand("cframewalk", {"cwalk", "cwalkspeed", "cws"}, "CFrame your character's walking with speed [speed]. If [seated?] is true, then you will not stop cwalking when you sit down.", {"speed", "disableondeath?", "running?", "seated?",}, function(a)
		local ableto = true
		local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

		seatbindcwalk = h.Seated:Connect(function(active)
			if active and not cwalkrunning then
				ableto = false
			elseif not active and not cwalkrunning then
				ableto = true
			end
		end)

		cwalkRun = false
		cwalkrunning = false

		if cwalk then
			cwalk:Disconnect()
			cwalk = nil
		end
		
		if a[2] and checkTrue(a[2]) then
			cwalkdisableondeath = true
		end
		
		if a[3] and checkTrue(a[3]) then
			cwalkRun = true
		end
		
		if a[4] and checkTrue(a[4]) then
			cwalkrunning = true
		end
		

		if a[1] then
			local value = tonumber(a[1])
			if value and plr.Character and value ~= 0 then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

				task.delay(2, function()
					local cwalkdied = nil
					cwalkdied = h.Died:Connect(function()
						if not cwalk and cwalkdied then cwalkdied:Disconnect() return end
						if not cwalkdisableondeath then return end
						cwalk:Disconnect()
						cwalk = nil
						seatbindcwalk:Disconnect()
						cwalkdied:Disconnect()
					end)
					
					
					local cwalkcharacteradd = nil
					cwalkcharacteradd = plr.CharacterAdded:Connect(function()
						if not cwalk and cwalkcharacteradd then cwalkcharacteradd:Disconnect() return end
						runCmd("cwalk off")
						task.wait(1)
						if cwalkdisableondeath then return end
						runCmd("cwalk ".. value.. " "..tostring(cwalkdisableondeath).. " ".. tostring(cwalkRun).. " ".. tostring(cwalkrunning))
 					end)

				end)

				cwalk = runsrv.Stepped:Connect(function()
					local h2  = plr.Character:FindFirstChildWhichIsA("Humanoid")
					
					if cwalkRun then

						if h2 and h2:GetState() == Enum.HumanoidStateType.Running and plr.Character and ableto then
							local amplification = Vector3.new(value, value, value) * h2.MoveDirection
							shouldbe = shouldbe + amplification
							plr.Character:PivotTo(plr.Character.PrimaryPart.CFrame + amplification)
						end
					else
						if h2 and h2.MoveDirection ~= Vector3.new(0,0,0) and plr.Character and ableto then
							local amplification = Vector3.new(value, value, value) * h2.MoveDirection
							shouldbe = shouldbe + amplification
							if plr.Character and plr.Character.PrimaryPart then
								plr.Character:PivotTo(plr.Character.PrimaryPart.CFrame + amplification)
							end
						end
					end
					task.wait(.1)
				end)
			elseif string.lower(a[1]) == "off" or string.lower(a[1]) == "none" then
				if cwalk then
					cwalk:Disconnect()
				end
			else
				if cwalk then
					cwalk:Disconnect()
				end
			end
		else
			if cwalk then
				cwalk:Disconnect()
			end
		end
	end)


	local walkfling = nil
	local flingintensity = 1
	
	
	addCommand("walkfling", {"wfling", "wf"}, "Apply a force to your character to fling people that touch you.", {"strength"}, function(a)
		if walkfling then 
			runCmd("unwf")
		end
		flingintensity = 1
		
		if a and a[1] and tonumber(a[1]) then
			flingintensity = tonumber(a[1])
		end

		local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			local aa
			aa = humanoid.Died:Connect(function()
				runCmd("unwf")
				aa:Disconnect()
			end)
		end

		walkfling = runsrv.Heartbeat:Connect(function()
			local char = plr.Character
			local root = char.PrimaryPart
			local hum = char:FindFirstChildWhichIsA("Humanoid")
			local vel, movel = nil, 0.1

			vel = root.Velocity
			root.Velocity = vel * (10000 * flingintensity) + Vector3.new(0,10000,0)

			runsrv.RenderStepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel
			end

			runsrv.Stepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		end)

	end)

	addCommand("unwalkfling", {"unwfling", "unwf"}, nil, {}, function(a)
		if walkfling then 
			local savedpos = plr.Character.PrimaryPart.Position
			walkfling:Disconnect()
			walkfling = nil
			runCmd("freeze")
			runCmd("gotov3 ".. savedpos.X .." ".. savedpos.Y .." ".. savedpos.Z .." ")
			task.wait(.1)
			runCmd("unfreeze")
		end
	end)
	
	addCommand("velocity", {}, "Set your velocity to a certain value", {"velocity"}, function(a)
		if a and a[1] and a[2] and a[3] and tonumber(a[1]) and tonumber(a[2]) and tonumber(a[3]) then
			local char = plr.Character
			if char then
				for i, v in pairs(char:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Velocity = Vector3.new(tonumber(a[1]), tonumber(a[2]), tonumber(a[3]))
					end
				end
			end
		end
	end)
	
	local stopfling = false

	addCommand("fling", {}, "Teleport to a player and attempt to fling them. May not work if they are moving.", {"player", "strength"}, function(a)
		local savedpos = plr.Character.PrimaryPart.Position
		
		local v = 1
		if a and a[2] and tonumber(a[2]) then
			v = tonumber(a[2])
		end
		
		
		
		
		if a and a[1] and getPlayer(a[1]) and not stopfling then
			runCmd("walkfling ".. v)
			runCmd("loopto ".. a[1])
			
			
			repeat
				task.wait()
			until stopfling or getPlayer(a[1]).Character.PrimaryPart.Velocity.Magnitude >= 100 or plr.Character:FindFirstChildWhichIsA("Humanoid").Health <= 0 or getPlayer(a[1]).Character:FindFirstChildWhichIsA("Humanoid").Health <= 0
			
			runCmd("unwalkfling")
			runCmd("unloopto")
			runCmd("freeze")
			runCmd("velocity 0 0 0")
			runCmd("gotov3 ".. savedpos.X .." ".. savedpos.Y .." ".. savedpos.Z .." ")
			runCmd("unfreeze")
		end
	end)
	
	addCommand("stopfling", {}, "Stop the current fling", {}, function(a)
		stopfling = true
		task.delay(3, function()
			stopfling = false
		end)
	end)
	
	addCommand("toolfling", {"tfling"}, "Shove a tool into your character to act as your collision part. This allows you to fling people in games that have tools with collisions but have character collisions disabled.", {"player", "strength"}, function(a)
		if a and a[1] then
			local v = 1
			if a[2] and tonumber(a[2]) then
				v = tonumber(a[2])
			end
			
			local char = plr.Character
			if char then
				local tool = char:FindFirstChildWhichIsA("Tool")
				if tool and tool.RequiresHandle and tool:FindFirstChild("Handle") then
					local savedgrippos = tool.GripPos
					
					runCmd("grippos 2 1 1")
					runCmd("fling ".. a[1].. " ".. v)
					runCmd("grippos ".. savedgrippos.X.. " ".. savedgrippos.Y.. " ".. savedgrippos.Z)
					
				end
			end
			
			
			
		end
	end)


	addCommand("drivefling", {"dfling", "df"}, nil, {}, function(a)
		if walkfling then 
			runCmd("unwf")
		end

		local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			local aa
			aa = humanoid.Died:Connect(function()
				runCmd("unwf")
				aa:Disconnect()
			end)
		end

		humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
			if not humanoid.Sit and walkfling then
				runCmd("unwf")
			end
		end)

		if humanoid.Sit then
			walkfling = runsrv.Heartbeat:Connect(function()
				local char = plr.Character
				local root = char.PrimaryPart
				humanoid = char:FindFirstChildWhichIsA("Humanoid")
				local vel, movel = nil, 0.1

				vel = root.Velocity
				root.Velocity = vel * 10000 + Vector3.new(0,10000,0)

				runsrv.RenderStepped:Wait()
				if char and char.Parent and root and root.Parent then
					root.Velocity = vel
				end

				runsrv.Stepped:Wait()
				if char and char.Parent and root and root.Parent then
					root.Velocity = vel + Vector3.new(0, movel, 0)
					movel = movel * -1
				end
			end)
		end
	end)


	addCommand("uncframewalk", {"uncwalk"}, "Stop Cframe Walk", {}, function(a)
		if cwalk then
			cwalk:Disconnect()
			cwalk = nil
		end
		if seatbindcwalk then
			seatbindcwalk:Disconnect()
		end
	end)

	addCommand("goto", {"to"}, "Teleport to [player]. If [anchored?] is true, then your character will be anchored before teleporting and unanchored after.", {"player", "anchored?"}, function(a)
		if a[1] then
			local player = getPlayer(a[1])
			if player and plr.Character and player.Character and player.Character.PrimaryPart and plr.Character.PrimaryPart then
				if a[2] then
					if checkTrue(a[2]) then
						plr.Character.PrimaryPart.Anchored = true
					end
				end
				shouldbe = player.Character.PrimaryPart.Position
				plr.Character:PivotTo(CFrame.new(player.Character.PrimaryPart.Position))
				task.wait(.15)
				plr.Character.PrimaryPart.Anchored = false
			end	
		end
	end)

	addCommand("unanchor", {"unfreeze", "thaw"}, nil, {}, function(a)
		if plr.Character and plr.Character.PrimaryPart then
			plr.Character.PrimaryPart.Anchored = false
		end
	end)

	addCommand("anchor", {"freeze"}, nil, {}, function(a)
		if plr.Character and plr.Character.PrimaryPart then
			plr.Character.PrimaryPart.Anchored = true
		end
	end)

	local loopgoto = nil

	addCommand("loopgoto", {"loopto"}, "Loop teleport to [player]. If [anchored?] is true, then your character will be anchored before teleporting and unanchored after.", {"player", "anchored?"}, function(a)
		if loopgoto then
			loopgoto:Disconnect()
		end

		if a[1] then
			loopgoto = runsrv.Stepped:Connect(function()
				local player = getPlayer(a[1])
				local x = false
				if a[2] then
					if checkTrue(a[2]) then
						x = true
					end
				end
				if player then
					runCmd("goto ".. player.Name.. " ".. tostring(x))
				end
			end)
		else
			if loopgoto then
				loopgoto:Disconnect()
			end
		end
	end)

	addCommand("unloopgoto", {"unloopto", "stoploopto", "stoploopgoto"}, nil, {}, function(a)
		if loopgoto then
			loopgoto:Disconnect()
		end
	end)


	local noclip = nil
	addCommand("noclip", {}, "Walk through walls", {}, function(a)
		if noclip then
			noclip:Disconnect()
		end

		noclip = runsrv.Stepped:Connect(function()
			if plr.Character then
				for i, v in pairs(plr.Character:GetDescendants()) do
					if v:IsA("BasePart") and v.CanCollide and v ~= platform then
						v.CanCollide = false
					end
				end
			end
		end)

	end)

	addCommand("clip", {}, "Stop walking through walls", {}, function(a)
		if noclip then
			noclip:Disconnect()
		end
	end)


	local vhparts = {}
	addCommand("vehiclenoclip", {"vnoclip"}, "Make your car noclip", {}, function(a)
		for i, v in pairs(vhparts) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
		vhparts = {}
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

			if h then
				if h.SeatPart then
					local sp = h.SeatPart
					local vmodel = sp.Parent
					repeat
						if not vmodel:IsA("Model") then
							vmodel = vmodel.Parent
						end
					until vmodel.ClassName == "Model"
					task.wait(.1)
					cmds["noclip"].callback({})
					for i, v in pairs(vmodel:GetDescendants()) do
						if v:IsA("BasePart") then
							if v.CanCollide then
								v.CanCollide = false
								table.insert(vhparts, v)
							end
						end
					end
				end
			end

		end

	end)

	addCommand("vehicleclip", {"vclip", "unvehiclenoclip", "unvnoclip"}, "Stop your car from phasing through things", {}, function(a)
		for i, v in pairs(vhparts) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end

		vhparts = {}

	end)

	addCommand("view", {"spectate", "spy"}, "Move your camera to where someone is", {"player"},function(a)
		local cam = workspace.CurrentCamera
		if a[1] then			
			local player = getPlayer(a[1]) 
			if player then
				if player.Character then
					cam.CameraSubject = player.Character
				end
			end
		else
			if plr.Character then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
				if h then
					cam.CameraSubject = h
				end
			end
		end
	end)

	addCommand("unview", {"stopview", "unspectate"}, "View yourself again", {}, function(a)
		local cam = workspace.CurrentCamera
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
			if h then
				cam.CameraSubject = h
			end
		end
	end)

	addCommand("dex", {"explorer", "dexexplorer"}, nil, {}, function(a)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	end)


	local platformFloat = 0.087
	local pSize = Vector3.new(4,.25,4)
	addCommand("platform", {}, "Put an invisible platform at your feet", {"size", "visible?"}, function(a)
		platformFloat = 0.087

		if platformC then
			platformC:Disconnect()
		end

		pSize = Vector3.new(4,.25,4)
		if a[1] then
			if tonumber(a[1]) then
				pSize = Vector3.new(a[1], .25, a[1])
			end
		end

		local vis = 1
		if a[2] then
			if string.lower(a[2]) == "yes" or string.lower(a[2]) == "true" or string.lower(a[2]) == "t" or string.lower(a[2]) == "y" then
				vis = 0
			end
		end


		platformC = runsrv.Stepped:Connect(function()
			if plr.Character then
				local hrp = plr.Character.PrimaryPart
				local pos = nil



				if hrp then

					if not platform then
						platform = Instance.new("Part", plr.Character)
						platform.Name = rName()
						platform.Transparency = vis
						platform.Size = pSize
						platform.Anchored = true
					else
						if plr.Character:FindFirstChild("UpperTorso") then
							pos = hrp.Position - Vector3.new(0,plr.Character.LeftFoot.Size.Y + plr.Character.LeftLowerLeg.Size.Y + plr.Character.LeftUpperLeg.Size.Y + hrp.Size.Y/4 - platformFloat,0)   
						elseif plr.Character:FindFirstChild("Torso") then
							pos = hrp.Position - Vector3.new(0, plr.Character.LeftLeg.Size.Y - hrp.Size.Y/4 - platformFloat,0)
						end

						if pos then
							platform.Position = pos
							platform.Size = pSize
							platform.Transparency = vis
						end
					end
				end
			end
		end)

	end)

	addCommand("unplatform", {"deplatform"}, "Stop putting an invisible platform at your feet", {}, function(a)
		if platformC then
			platformC:Disconnect()
			platformC = nil
		end

		if platform then
			platform:Destroy()
			platform = nil
		end

	end)

	addCommand("jumppower", {"jp", "jpower"}, "Set your humanoid's jump power to [power]", {"power"}, function(a)
		local setTo = 50
		if a[1] then
			if tonumber(a[1]) then
				setTo = tonumber(a[1])
			end
		end
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
			if h then
				h.UseJumpPower = true
				h.JumpPower = setTo
			end
		end
	end)

	addCommand("jumpheight", {"jh", "jheight"}, nil, {"height"}, function(a)
		local setTo = 7.2
		if a[1] then
			if tonumber(a[1]) then
				setTo = tonumber(a[1])
			end
		end
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
			if h then
				h.UseJumpPower = false
				h.JumpHeight = setTo
			end
		end
	end)


	addCommand("platformfloat", {"pf"}, nil, {"value"}, function(a)
		if a[1] then
			if not tonumber(a[1]) then
				if string.lower(a[1]) == "default" or string.lower(a[1]) == "def" then
					platformFloat = 0.087
				elseif string.lower(a[1]) == "lower" then
					platformFloat = 0.07
				elseif string.lower(a[1]) == "nofall" then
					platformFloat = -1
				end
			else
				local val = tonumber(a[1])
				platformFloat = val/10
			end
		end
	end)


	local flyspeed = 1
	addCommand("fly", {}, nil, {"speed"}, function(a)
		flyspeed = 1

		if a[1] then
			if tonumber(a[1]) then
				flyspeed = tonumber(a[1])
			end
		end

	end)

	addCommand("gotov3", {"gotopos"}, "Teleport to a Vector3 value. Defaults to 0,0,0", {"x", "y", "z"}, function(a)
		local x = 0
		local y = 0
		local z = 0

		if a[1] then
			if tonumber(a[1]) then
				x = a[1]
			end
		end


		if a[2] then
			if tonumber(a[2]) then
				y = a[2]
			end
		end

		if a[3] then
			if tonumber(a[3]) then
				z = a[3]
			end
		end

		if plr.Character then
			plr.Character:MoveTo(Vector3.new(x,y,z))
		end

	end)

	local esps = {}
	local espcon = nil

	local espcontainer = Instance.new("Folder", scr)
	espcontainer.Name = rName()
	setName(espcontainer, "EspContainer")
	
	addCommand("locate", {"find"}, "Apply ESP to a player", {"player"}, function(a)
		if a and a[1] then
			local player: Player = getPlayer(a[1])
			if player then
				
				print(esps[player])
				
				if not esps[player] then
					local plrFolder = Instance.new("Folder", espcontainer)
					plrFolder.Name = rName()
					setName(plrFolder, player.Name)
					esps[player] = {
						PlayerRemovedEvent = player.Destroying:Once(function()
							if esps[player] then
								disconnectTable(esps[player])
								table.remove(esps, table.find(esps, player))
								
							end
							local folder = getChild(scr, esps[player.Name])
							if folder then folder:Destroy() end
						end),
						ContainerRemoved = plrFolder.Destroying:Once(function()
							if esps[player] then
								disconnectTable(esps[player])
								table.remove(esps, table.find(esps, player))
 
							end
							local folder = getChild(scr, esps[player.Name])
							if folder then folder:Destroy() end
						end)
						
					}
					
					local character = player.Character
					repeat
						wait()
						character = player.Character
					until character
					
					local hum = character:FindFirstChildWhichIsA("Humanoid")
					
					for i, v in pairs(character:GetChildren()) do

						if v:IsA("BasePart") then
							if v.Name ~= "Head" then
								local espAdorn = Instance.new("BoxHandleAdornment", plrFolder)
								espAdorn.Name = rName()
								setName(espAdorn, v.Name)
								espAdorn.Adornee = v
								espAdorn.Size = v.Size
								espAdorn.AdornCullingMode = Enum.AdornCullingMode.Never
								espAdorn.AlwaysOnTop = true
								espAdorn.Color3 = player.TeamColor.Color
								espAdorn.ZIndex = 5
								espAdorn.Transparency = .5
							else
								local espAdorn = Instance.new("BoxHandleAdornment", plrFolder)
								espAdorn.Name = rName()
								setName(espAdorn, v.Name)
								espAdorn.Adornee = v
								if hum and hum.RigType == Enum.HumanoidRigType.R6 then
									espAdorn.Size = Vector3.new(v.Size.Z, v.Size.Y, v.Size.Z)
								else
									espAdorn.Size = v.Size
								end
								espAdorn.AdornCullingMode = Enum.AdornCullingMode.Never
								espAdorn.AlwaysOnTop = true
								espAdorn.Color3 = player.TeamColor.Color
								espAdorn.ZIndex = 5
								espAdorn.Transparency = .5
								local billboard = Instance.new("BillboardGui", plrFolder)
								billboard.Name = rName()
								setName(billboard, "GUI")
								billboard.Size = UDim2.new(0,125,0,50)
								billboard.Adornee = v
								billboard.LightInfluence = 0
								billboard.AlwaysOnTop = true
								billboard.StudsOffset = Vector3.new(0,2.5,0)
								local label1 = Instance.new("TextLabel", billboard)
								label1.Name = rName()
								setName(label1, "Text")
								label1.Text = player.Name
								label1.FontFace = Font.fromEnum(Enum.Font.Nunito)
								label1.BackgroundTransparency = 1
								label1.Size = UDim2.new(1,0,1,0)
								label1.TextColor3 = player.TeamColor.Color
								label1.TextSize = 20
								label1.TextStrokeTransparency = 0
							end
						end
					end
					

					local wireframe = Instance.new("WireframeHandleAdornment", plrFolder)
					wireframe.Name = rName()
					setName(wireframe, "wireframeoutline")
					wireframe.Adornee = character
					wireframe.Color3 = Color3.new(1,1,1)
					wireframe.AlwaysOnTop = true
					wireframe.ZIndex = 5
					
					
				end
				
				
				
				
				if not espcon then
					espcon = runsrv.Heartbeat:Connect(function()
						local int = 0
						for i, v in pairs(esps) do
							int += 1
							if not players:FindFirstChild(i.Name) then
								disconnectTable(esps[i])
								esps[i] = nil
								local folder = getChild(espcontainer, i.Name)
								if folder then folder:Destroy() end
								return
							end
							local folder = getChild(espcontainer, i.Name)
							if folder and i.Character then
								for z, c in pairs(folder:GetChildren()) do
									local name = getName(c)
									if name and i.Character:FindFirstChild(name) and string.match(string.lower(c.ClassName), "adornment") and not c:IsA("WireframeHandleAdornment") then
										c.Adornee = i.Character:FindFirstChild(name)
										c.Color3 = i.TeamColor.Color
									elseif name and name == "wireframeoutline" and c:IsA("WireframeHandleAdornment") then
										c:Clear()
										c.Adornee = i.Character
										
										c.Color3 = i.TeamColor.Color
										
										local bbpos, bbsize = i.Character:GetBoundingBox()
										
										local x = bbsize.X / 2
										local y = bbsize.Y / 2
										local z = bbsize.Z / 2
										
										local lines = {
											Vector3.new(x, y, z),
											Vector3.new(x, -y, z),
											Vector3.new(x, y, z),
											Vector3.new(-x, y, z),
											Vector3.new(x, y, z),
											Vector3.new(x, y, -z),
											Vector3.new(-x,y,-z),
											Vector3.new(x, y, -z),
											Vector3.new(-x,y,-z),
											Vector3.new(-x,y,z),
											Vector3.new(-x,y,-z),
											Vector3.new(-x,-y,-z),
											Vector3.new(x, -y, -z),
											Vector3.new(x, -y, z),
											Vector3.new(x, -y, -z),
											Vector3.new(-x, -y, -z),
											Vector3.new(x, -y, -z),
											Vector3.new(x, y, -z),
											Vector3.new(-x, -y, z),
											Vector3.new(-x, -y, -z),
											Vector3.new(-x, -y, z),
											Vector3.new(-x, y, z),
											Vector3.new(-x, -y, z),
											Vector3.new(x, -y, z),

										}
										
										c:AddLines(lines)
									elseif name and name == "GUI" and c:IsA("BillboardGui") then
										local label = c:FindFirstChildWhichIsA("TextLabel")
										c.Adornee = i.Character:FindFirstChild("Head")
										if i.Character and i.Character:FindFirstChildWhichIsA("Humanoid") and i.Character.PrimaryPart then
											label.Text = `{i.Name} | {i.Character:FindFirstChild("Humanoid").Health}HP | Distance: {math.round(math.abs((i.Character.PrimaryPart.Position - plr.Character.PrimaryPart.Position).Magnitude))}S`
										end
										label.TextColor3 = i.TeamColor.Color
									end
								end
							end
						end
						if int == 0 then
							espcon:Disconnect()
							espcon = nil
						end
					end)
				end
			end
		end
	end)
	
	addCommand("unlocate", {}, "Unlocate a player or everyone if [player] is unspecified.", {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1]) 
			if player then
				if esps[player] then
					disconnectTable(esps[player])
					esps[player] = nil
				end
				local folder = getChild(espcontainer, player.Name)
				if folder then folder:Destroy() end
			else
				for i, v in pairs(esps) do
					disconnectTable(v)
					esps[i] = nil
				end
			end
		end
	end)
	
	local espplayeraddconn = nil
	
	addCommand("esp", {}, "Equivalent to running locate all", {}, function(a)
		if not espcon then
			runCmd("locate all")
		else
			runCmd("unlocate all")
		end
		
		if not espplayeraddconn then
			espplayeraddconn = players.PlayerAdded:Connect(function(p)
				runCmd(`locate {p.Name}`)
			end)
		else
			espplayeraddconn:Disconnect()
			espplayeraddconn = nil
		end
		
	end)

	addCommand("headsize", {"hs", "hsize"}, "Set [player]'s headsize.", {"player", "size"}, function(a)
		if a[1] and a[2] and tonumber(a[2]) then
			if a[1] == "all" then
				for i, v in pairs(players:GetPlayers()) do
					if v.Character and v.Character:FindFirstChild("Head") and v ~= plr then
						v.Character:FindFirstChild("Head").Size = Vector3.new(tonumber(a[2]), tonumber(a[2]), tonumber(a[2]))
						v.Character:FindFirstChild("Head").CanCollide = false
					end
				end
			else
				local player = getPlayer(a[1])
				if player and player.Character and player.Character:FindFirstChild("Head") then
					player.Character:FindFirstChild("Head").Size = Vector3.new(tonumber(a[2]), tonumber(a[2]), tonumber(a[2]))
					player.Character:FindFirstChild("Head").CanCollide = false
				end
			end
		end
	end)

	addCommand("notouch", {"stoptouch", "disabletouch"}, "Disable the CanTouch property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanTouch == true then
					v.CanTouch = false
				end
			end
		end

	end)

	addCommand("touch", {}, "Enable the CanTouch property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanTouch == false then
					v.CanTouch = true
				end
			end
		end

	end)

	addCommand("query", {}, "Enable the CanQuery property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanQuery == false then
					v.CanQuery = true
				end
			end
		end

	end)

	addCommand("noquery", {"stopquery", "disableqeury"}, "Disable the CanQuery property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanQuery == true then
					v.CanQuery = false
				end
			end
		end

	end)


	local poinths = nil
	addCommand("pointheadsize", {"phs", "poinths"}, "set the headsize of whoever your mouse is on to [size]", {"size"}, function(a)
		if poinths then
			poinths:Disconnect()
			poinths = nil
		end

		for i, v in pairs(players:GetPlayers()) do
			if v.Character:FindFirstChild("Head") then
				v.Character:WaitForChild("Head").Size = Vector3.new(1,1,1)
			end
		end

		if a and a[1] and tonumber(a[1]) then
			local size = tonumber(a[1])
			poinths = runsrv.Heartbeat:Connect(function()
				local new = plr:GetMouse().Target

				for i, v in pairs(players:GetPlayers()) do
					if v.Character:FindFirstChild("Head") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Name ~= new.Parent.Name then
						v.Character:WaitForChild("Head").Size = Vector3.new(1,1,1)
					end
				end

				if new.Parent:FindFirstChildWhichIsA("Humanoid") and new.Parent:FindFirstChild("Head") then
					local head = new.Parent:WaitForChild("Head")
					head.Size = Vector3.new(size,size,size)
				elseif new.Parent:IsA("Accessory") then
					if new.Parent.Parent:FindFirstChildWhichIsA("Humanoid") and new.Parent.Parent:FindFirstChild("Head") then
						local head = new.Parent.Parent:WaitForChild("Head")
						head.Size = Vector3.new(size,size,size)
					end
				end
			end)
		end
	end)

	local wub = nil
	addCommand("walkunbound", {"wub"}, "CFrame your walkspeed", {"speed"}, function(a)
		if a and a[1] and tonumber(a[1]) then
			local char = plr.Character
			local hum = char:FindFirstChildWhichIsA("Humanoid")
			local root = char.PrimaryPart
			if char and hum and root then
				shouldbe = root.Position
				runCmd("cwalk ".. tonumber(a[1]))
				if not wub then
					wub = runsrv.Stepped:Connect(function()
						char:MoveTo(shouldbe)
					end)
				end
			end
		end
	end)

	addCommand("unwalkunbound", {"unwub", "nowub"}, nil, {}, function(a)
		if wub then 
			wub:Disconnect()
			runCmd("cwalk off")
			wub = nil
		end
	end)

	loopAAA = nil
	local ampl = 1
	addCommand("velocitywalk", {"velwalk", "vwalk"}, "Give yourself velocity in the direction you're walking, emulating setting your walkspeed.", {"velocity"}, function(a)
		if a and a[1] and tonumber(a[1]) then
			ampl = tonumber(a[1])
		end

		if plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid") then
			local hum = plr.Character:FindFirstChildWhichIsA("Humanoid")
			local root = plr.Character.PrimaryPart
			if not loopAAA then
				loopAAA = runsrv.Heartbeat:Connect(function()
					if wpressed then
						root.Velocity = root.Velocity + Vector3.new(ampl, ampl, ampl) * hum.MoveDirection * Vector3.new(1,0,1)
					end
				end)
			end

		end
	end)

	addCommand("unvelocitywalk", {"unvelwalk", "unvwalk"}, nil, {}, function(a)
		if loopAAA then
			loopAAA:Disconnect()
			loopAAA = nil
		end
	end)
	
	addCommand("gripposition", {"grippos"}, "Set the grip position of all equipped tools to the provided values", {"x","y","z"}, function(a)
		if a and a[1] and a[2] and a[3] and tonumber(a[1]) and tonumber(a[2]) and tonumber(a[3]) then
			local char = plr.Character
			if char then
				for i, v  in pairs(char:GetDescendants()) do
					if v:IsA("Tool") then
						v.Parent = plr.Backpack
						v.GripPos = Vector3.new(tonumber(a[1]), tonumber(a[2]), tonumber(a[3]))
						v.Parent = char
					end
				end
			end
		end
	end)

	

	addCommand("nosit", {}, "Remove your humanoid's ability to sit.", {}, function(a)
		if plr.Character then
			if plr.Character:FindFirstChildWhichIsA("Humanoid") then
				plr.Character:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			end
		end
	end)

	addCommand("unnosit", {"allowsit"}, "Allow your humanoid to sit.", {}, function(a)
		if plr.Character then
			if plr.Character:FindFirstChildWhichIsA("Humanoid") then
				plr.Character:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			end
		end
	end)

	addCommand("jump", {}, "Make your character jump.", {}, function(a)
		if plr.Character then
			if plr.Character:FindFirstChildWhichIsA("Humanoid") then
				plr.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)

	local usedSeats = {}
	addCommand("spawnseat", {"seatglitch", "invisibleseat", "icg"}, "Grab a static seat and bring it to your location. [tolerance] defaults to 75 and determines the minimum distance that seats must away from you be to grab them.", {"tolerance"}, function(a)

		local tolerance = a[1] or 75

		local seats = {}
		notify("spawnseat", "Grabbing Seats...", 5)

		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("Seat") and not v.Parent:FindFirstChildWhichIsA("VehicleSeat") and not v.Parent.Parent:FindFirstChildWhichIsA("VehicleSeat") and v.Anchored and not table.find(usedSeats, v) and plr.Character and plr.Character.PrimaryPart and math.abs(plr.Character.PrimaryPart.Position - v.Position).Magnitude > 75 then
				table.insert(seats, v)
			end
			task.wait()
		end

		notify("spawnseat", "Seats Grabbed!", 5)
		notify("spawnseat", "Sorting in order of distance...", 5)

		table.sort(seats, function(s1, s2)
			local d1 = math.abs(plr.Character.PrimaryPart.Position - s1.Position).Magnitude
			local d2 = math.abs(plr.Character.PrimaryPart.Position - s2.Position).Magnitude

			if d1 < s2 then
				return true
			else
				return false
			end


		end)

		notify("spawnseat", "Sorted seats!", 5)

		table.insert(usedSeats, seats[1])
		local seat = seats[1]




	end)
	
	addCommand("mouseteleport", {"mousetp", "mtp"}, "Teleport to your mouse", {}, function(a)
		local mouse = plr:GetMouse()
		if mouse and mouse.Hit then
			runCmd(`gotov3 {mouse.Hit.Position.X} {mouse.Hit.Position.Y} {mouse.Hit.Position.Z}`)
		end
	end)

	addCommand("serverhop", {}, "Rejoin the game in a random server.", {}, function(a)
		
		notify("Rejoin", "Please wait...", 2)
		wait(1)
		
		teleports:Teleport(game.PlaceId, plr)
	end)
	
	addCommand("rejoin", {"rj"}, "Rejoin the same server.", {}, function(a)

		notify("Rejoin", "Please wait...", 2)
		wait(1)

		teleports:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
	end)
	
	local freecamconn = nil
	local freecamconninput = nil
	local freecamspeed = 1
	addCommand("freecam", {"fc"}, nil, {"speed"}, function(a)
		
		local speedpassed = false
		if a and a[1] and tonumber(a[1]) then
			freecamspeed = tonumber(a[1])
			speedpassed = true
		end
		
		if freecamconn and not speedpassed then
			freecamconn:Disconnect()
			freecamconninput:Disconnect()
			freecamconn = nil
			freecamconninput = nil
			freecamspeed = 1
			cas:UnbindAction("BlockMovement")
			return
		end
		
		if not freecamconn then
			cas:BindAction("BlockMovement", function() return Enum.ContextActionResult.Sink end, false, Enum.KeyCode.W, Enum.KeyCode.D, 
				Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.Space, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Right, Enum.KeyCode.Left)

			freecamconn = runsrv.RenderStepped:Connect(function(dt)
				
				local movevec = Vector3.zero
				local cf = workspace.CurrentCamera.CFrame
				
				if uis:IsKeyDown(Enum.KeyCode.W) then movevec += cf.LookVector * freecamspeed end
				if uis:IsKeyDown(Enum.KeyCode.S) then movevec -= cf.LookVector * freecamspeed end
				if uis:IsKeyDown(Enum.KeyCode.D) then movevec += cf.RightVector * freecamspeed end
				if uis:IsKeyDown(Enum.KeyCode.A) then movevec -= cf.RightVector * freecamspeed end
				if uis:IsKeyDown(Enum.KeyCode.E) then movevec += cf.UpVector * freecamspeed end
				if uis:IsKeyDown(Enum.KeyCode.Q) then movevec -= cf.UpVector * freecamspeed end
				
			end)
		end
		
		
		
		
		
	end)
	
	
	local gameType = nil
	local vulnerabilities = loadstring(game:HttpGet("https://raw.githubusercontent.com/aezurewrath/AEZURE/refs/heads/main/vulnerabilities.lua"))()
	
	genv.vulnMethods = {}

	for i, v in pairs(vulnerabilities) do
		
		if readfile then
			for it, method in pairs(v.methods) do
				local s, e = pcall(function()
					return readfile(`aezure/{it}.aeovw`)
				end)
				if s and e then
					v.methods[it] = loadstring(e)()
				end
				genv.vulnMethods[it] = v.methods[it]
			end
		end
		
		for _, command in pairs(v.commands) do
			command[1] = `{i}:{command[1]}`
			for ti, alias in pairs(command[2]) do
				command[2][ti] = `{i}:{command[2][ti]}`
			end
			addCommand(unpack(command))
		end
	end
	
	if listfiles then
		local s, e = pcall(function()
			return listfiles(`aezure`)
		end)
		
		if s and e then
			for i, v in pairs(e) do
				local split = string.split(v, ".")
				if split[#split] == "aeplgn" then
					local s1, e1 = pcall(function()
						return readfile(v)
					end)
					if s1 and e1 then
						local pluginsub = string.gsub(v, "aezure", "")
						pluginsub = string.gsub(pluginsub, ".aeplgn", "")
						currentplugin = pluginsub
						local _plugin = loadstring(e1)()
					end
				end
			end
		end
	end
	
	currentplugin = nil
	
	
	addCommand("reloadmethods", {}, "Reload your method overwrites", {}, function(a)
		for i, v in pairs(vulnerabilities) do
			if readfile then
				for it, method in pairs(v.methods) do
					local s, e = pcall(function()
						return readfile(`aezure/{it}.aeovw`)
					end)
					if s and e then
						v.methods[it] = loadstring(e)()
					end
					genv.vulnMethods[it] = v.methods[it]
				end
			end
		end
	end)
	
	addCommand("scan", {"findremote"}, "Search for vulnerabilities in games. If [path] is specified, it will scan only in the path. Provide [type] to search for a specific type. Use command 'types' to view all vuln types. ", {"type", "path"}, function(a)
		local path = game
		if a and a[2] then
			local s, e = pcall(function()
				path = loadstring("return ".. tostring(a[2]))()
			end)
		end
		
		
		print(vulnerabilities[a[1]])
		print(a[1])
		if vulnerabilities[a[1]] then
			local scan = vulnerabilities[a[1]].scan(path)
			if scan then
				notify("Scan Result", `{scan.Name} has been found`, 5)
			end
		end
	end)

	-- uhh add the commands to the dumb stupid thing


	for i, v in pairs(cmds) do
		local tmp = {}
		for z, c in pairs(v["args"]) do
			table.insert(tmp, tostring("[".. c .."]"))
		end
		local aliases = {}
		for z, c in pairs(v["aliases"]) do
			if c ~= tostring(i) then
				table.insert(aliases, tostring("[".. c .."]"))
			end
		end

		local concat = table.concat(tmp, " ")
		local aliasesc = table.concat(aliases, " ")

		local newlabel = aeLib.ListLabelNoButtons(commandList._List, tostring(i).." ".. concat)

		newlabel.Main:GetPropertyChangedSignal("GuiState"):Connect(function()
			local newstate = newlabel.Main.GuiState

			if newstate == Enum.GuiState.Idle then
				updatemousefollower("", "", false)
			elseif newstate == Enum.GuiState.Hover then
				updatemousefollower(tostring(i).." ".. aliasesc, tostring(v["description"]), true)
			end

		end)

	end
	
	-- [[COMMAND BAR SETUP]] --


	cmdBar.Focused:Connect(function()
		cmdBar.PlaceholderText = ""
		cas:BindAction("BlockTabPrediction", function() return Enum.ContextActionResult.Sink end, false, Enum.KeyCode.Tab)
		openCmdLine()
	end)


	local selectedPrediction = nil
	local predictionsList = {}
	
	cmdBar:GetPropertyChangedSignal("Text"):Connect(function()
		cmdBar.Text = string.gsub(cmdBar.Text, "	", "")
		if cmdBar.Text ~= "" and not string.split(cmdBar.Text, " ")[2] then
			commandlineMain.Predictions.Visible = true
			commandlineMain.Predictions.Position = UDim2.new(0.101, #cmdBar.Text * 5,-0.09, 0)
			for i, v in pairs(commandlineMain.Predictions:GetChildren()) do if v:IsA("TextLabel") then v:Destroy() table.clear(predictionsList) end end
			commandlineMain.Predictions.CanvasSize = UDim2.new(0, 0, 0.5, 0)
			commandlineMain.Predictions.CanvasPosition = Vector2.new(0, commandlineMain.Predictions.CanvasSize.Y.Offset)
			local count = 0
			selectedPrediction = nil
			for i, v in pairs(cmds) do
				for z, c in ipairs(v["aliases"]) do
					local c1 = string.split(c, ":")
					if #c1 > 1 then
						table.remove(c1, 1)
					end
					c1 = table.concat(c1, "")
					local a = string.sub(string.lower(c1),1,string.len(cmdBar.Text))
					if string.match(a, cmdBar.Text) then
						count += 1
						local prediction : GuiObject = aeLib.AddPrediction(commandlineMain.Predictions, c)
						table.insert(predictionsList, prediction)
						if count * prediction.AbsoluteSize.Y >= commandlineMain.Predictions.AbsoluteSize.Y then
							commandlineMain.Predictions.CanvasSize += UDim2.new(0,0,0,prediction.AbsoluteSize.Y)
							commandlineMain.Predictions.CanvasPosition = Vector2.new(0, commandlineMain.Predictions.CanvasSize.Y.Offset)
						end
						
					end
				end
			end
			
			local lastprediction = predictionsList[#predictionsList]
			
			if lastprediction then
				lastprediction.BackgroundColor3 = colors.light
				lastprediction.BorderColor3 = colors.white
				selectedPrediction = lastprediction
			end
		else
			commandlineMain.Predictions.Visible = false
			for i, v in pairs(commandlineMain.Predictions:GetChildren()) do if v:IsA("TextLabel") then v:Destroy() end end
			selectedPrediction = nil

		end
	end)


	cmdBar.FocusLost:Connect(function(enter)
		if enter then
			task.spawn(function()
				runCmd(cmdBar.Text)
			end)
		end
		cas:UnbindAction("BlockTabPrediction")
		closeCmdLine()
		cmdBar.PlaceholderText = "ÆZURE"
		cmdBar.Text = ""
		commandlineMain.Predictions.Position = UDim2.new(0.101, 0,-0.09, 0)
	end) 



	uis.InputBegan:Connect(function(inp, e)
		if not e then

			if kbinding then
				binding = false
				if kc(tostring(inp.KeyCode)) then
					kbindselect = inp.KeyCode
					setbindbutton.Main.Text = `Keybind: {tostring(inp.KeyCode.Name)}`
					kbinding = false
				end

			elseif binding then
				kbinding = false
				if kc(tostring(inp.KeyCode)) then
					local label = sttngsL[activeSlabel]
					_settings[activeSlabel] = inp.KeyCode
					label._Button.Text = tostring(inp.KeyCode.Name)
					binding = false
					local newData = returnsavedata() 
					saveData(newData)
				end
			else
				if inp.KeyCode == _settings.Prefix then
					cmdBar.Text = ""
					task.wait(.05)
					openCmdLine()
					cmdBar:CaptureFocus()
				end

				for i, v in pairs(keybinds) do
					if inp.KeyCode == v.keybind and not v.toggle then
						runCmd(v.command)
					elseif inp.KeyCode == v.keybind and v.toggle then
						if keybindsStates[i] == false then
							runCmd(v.command)
							keybindsStates[i] = true
						else
							runCmd(v.command2)
							keybindsStates[i] = false
						end
					end
				end
				
				
			end
		else
			if cmdBar:IsFocused() then
				local int = table.find(predictionsList, selectedPrediction)
				if inp.KeyCode == Enum.KeyCode.Up then

					if int and predictionsList[int-1] then
						selectedPrediction.BackgroundColor3 = colors.darkest
						selectedPrediction.BorderColor3 = colors.lightest

						local newselection = predictionsList[int-1]
						commandlineMain.Predictions.CanvasPosition -= Vector2.new(0, newselection.AbsoluteSize.Y)

						selectedPrediction = newselection
						print(newselection)
						print(newselection.Text)
						newselection.BackgroundColor3 = colors.light
						newselection.BorderColor3 = colors.white
					end

				elseif inp.KeyCode == Enum.KeyCode.Down then
					if int and predictionsList[int+1] then
						selectedPrediction.BackgroundColor3 = colors.darkest
						selectedPrediction.BorderColor3 = colors.lightest

						local newselection = predictionsList[int+1]
						commandlineMain.Predictions.CanvasPosition += Vector2.new(0, newselection.AbsoluteSize.Y)

						selectedPrediction = newselection
						print(newselection)
						print(newselection.Text)
						newselection.BackgroundColor3 = colors.light
						newselection.BorderColor3 = colors.white
					end
				elseif inp.KeyCode == Enum.KeyCode.Tab then
					if selectedPrediction then
						local split = string.split(cmdBar.Text, " ")
						split[#split] = selectedPrediction.Text
						split = table.concat(split, " ")
						
						cmdBar.Text = split
						cmdBar.CursorPosition = #cmdBar.Text
					end
				end
			end
		end
	end)
	
	wait(.5)
	closeCmdLine()
	--closeCLog:Play()
	
	

	
	
	
	
	
	
	  
	

	notify("Loaded fully!", "ÆZURE has fully loaded!", 5)
	notify("⚠️IMPORTANT⚠️", "This is a beta version of ÆZURE. Expect bugs.", 5)
end
