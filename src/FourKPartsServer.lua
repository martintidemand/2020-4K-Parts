


--City class
City = {}
City.__index = City
Cities = {}

function City.new(center, lastPart) --CFrame
	local newCity = {}
	setmetatable(newCity, City)


	newCity.center = center
	newCity.lastPart = lastPart
	newCity.layer = 1
	newCity.next = CFrame.new(0.1,0,0) --up
	newCity.number = 0
	table.insert(Cities,newCity)
end


function createCity(player,spot)
	local city = Instance.new("Model",game.Workspace)
	city.Name = "aCity"
	local cityCenter = Instance.new("Part",city)
	cityCenter.Anchored = true
	cityCenter.Size = Vector3.new(0.1,math.random(1,8)/10,0.1)
	cityCenter.CFrame = CFrame.new(spot.x,spot.y+cityCenter.Size.y/2,spot.z)
	cityCenter.Name = "Center"
	cityCenter.BrickColor = BrickColor.random()
	cityCenter.Locked = true
	
	City.new(cityCenter,cityCenter)
end


function addBuilding(player,target)
	print(target.parent:getChildren()[1])
	for index, value in ipairs(Cities) do
		if value["lastPart"].parent == target.parent then
			local model = value["lastPart"].parent
			value["number"] = value["number"] + 1
			
			local newBuilding = Instance.new("Part", model)
			newBuilding.Anchored = true
			newBuilding.Size = Vector3.new(0.1,math.random(1,8)/10,0.1)
			newBuilding.Name = "NotCenter"
			newBuilding.CFrame = CFrame.new(value["lastPart"].Position.x+value["next"].x,value["center"].Position.y-value["center"].Size.y/2+newBuilding.Size.y/2,value["lastPart"].Position.z+value["next"].z)
			newBuilding.BrickColor = BrickColor.random()
			newBuilding.Locked = true
		
			value["lastPart"] = newBuilding
			
			if value["number"] == 1 then
				value["next"] = CFrame.new(0,0,0.1)
			elseif value["number"] == value["layer"]*1+1 then
				value["next"] = CFrame.new(-0.1,0,0)
			elseif value["number"] == value["layer"]*3+1 then
				value["next"] = CFrame.new(0,0,-0.1)
			elseif value["number"] == value["layer"]*5+1 then
				value["next"] = CFrame.new(0.1,0,0)
			elseif value["number"] == value["layer"]*7+1 then
				value["next"] = CFrame.new(0,0,0.1)
			end
			
			print(value["number"])
			
			if (value["number"]/value["layer"])%8 == 0  then
				value["layer"] = value["layer"]+1
				value["next"] = CFrame.new(0.1,0,0.1)
				value["number"] = 0
			end
		end
	end
end



script.Parent.CreateCity.OnServerEvent:Connect(createCity)
script.Parent.AddBuilding.OnServerEvent:Connect(addBuilding)
