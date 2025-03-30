

local tool = script.Parent
 
local function onEquip()
	game.Players:FindFirstChild(script.parent.parent.Name).PlayerGui.ScreenGui.TextBox.Text = "No City Selected"
	game.Players:FindFirstChild(script.parent.parent.Name).PlayerGui.ScreenGui.Enabled = true
	game.Players:FindFirstChild(script.parent.parent.Name).PlayerGui.ScreenGui.LocalScript.Disabled = false
end
 
local function onUnequip()
	script.parent.parent.parent.PlayerGui.ScreenGui.Enabled = false
	script.parent.parent.parent.PlayerGui.ScreenGui.LocalScript.Disabled = true
end
 
local function onActivate()

end
 
local function onDeactivate()
end
 
tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)