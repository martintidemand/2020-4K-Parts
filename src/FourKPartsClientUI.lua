local UIS = game:GetService("UserInputService")


local player = game.Players.LocalPlayer
local selected
local extra = false
local mouse = player:GetMouse()



mouse.Button1Up:Connect(function()
	if mouse.Target.parent.Name == "Model" and mouse.Target.Name ~= "Part" then
		game.Workspace.CreateCity:FireServer(mouse.Hit)
	elseif mouse.Target.parent.name == "aCity" then
		selected = mouse.Target
		script.parent.TextBox.Text = #(mouse.Target.parent:GetChildren())
	end
end)

script.parent.TextButton.MouseButton1Click:Connect(function()
	if selected == nil then
		return
	end
	game.Workspace.AddBuilding:FireServer(selected)
	script.parent.TextBox.Text = #(selected.parent:GetChildren())
end)