-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("ContextActionService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("CollectionService")
local v_u_6 = v1.LocalPlayer
local v_u_7 = v_u_6:WaitForChild("PlayerGui")
local v8 = v3:WaitForChild("FishingSystem")
local v_u_9 = v8:WaitForChild("InventoryEvents")
local v10 = require(v8.Modules.InventoryData)
local v_u_11 = require(v8.Modules.InventoryUI)
local v_u_12 = require(v3:WaitForChild("TopbarPlus"):WaitForChild("Icon"))
local v_u_13 = v_u_9:WaitForChild("Inventory_EquipRod")
local v_u_14 = v_u_9:WaitForChild("Inventory_EquipFish")
local v_u_15 = v_u_9:WaitForChild("Inventory_ToggleFavorite")
local v_u_16 = v10.new()
local v_u_17 = nil
local v_u_18 = false
local v_u_19 = false
local function v_u_27() -- name: RenderInventory
	-- upvalues: (ref) v_u_18, (copy) v_u_16, (copy) v_u_6, (ref) v_u_17
	if v_u_18 then
		local v20 = v_u_16:BuildMasterList(v_u_6)
		for v21 = 1, 10 do
			v_u_17:RenderSlot(v_u_17.HotbarSlots[v21], v20[v21])
		end
		local v22 = 10
		for v23, _ in pairs(v20) do
			if v22 >= v23 then
				continue
			end
			v22 = v23
		end
		local v24 = v22 - 10
		for v25 = 11, v22 do
			v_u_17:RenderSlot(v_u_17:GetOrCreateBagSlot(v25), v20[v25])
		end
		for v26 = v24 + 1, #v_u_17.BagSlots do
			if not v_u_17.BagSlots[v26] then
				continue
			end
			v_u_17:ClearSlot(v_u_17.BagSlots[v26])
		end
		v_u_17:UpdateCanvasSize()
	end
end
local function v_u_31(p28, p29) -- name: OnSlotSwap
	-- upvalues: (copy) v_u_16, (copy) v_u_6, (copy) v_u_27
	local v30 = v_u_16:BuildMasterList(v_u_6)[p28]
	if v30 and (v30.Type == "Tool" and (v_u_16:IsRod(v30.Data) and (p28 > 10 and p29 <= 10))) then
		v_u_16:SwapSlots(p28, v_u_16.LastKnownRodSlot)
		v_u_27()
	else
		v_u_16:SwapSlots(p28, p29)
		v_u_27()
	end
end
local function v_u_33(p32) -- name: OnEmptyHotbar
	-- upvalues: (copy) v_u_16, (copy) v_u_27
	v_u_16:MoveToBag(p32)
	v_u_27()
end
local function v_u_42(p34) -- name: OnSlotClicked
	-- upvalues: (copy) v_u_6, (copy) v_u_16, (copy) v_u_13, (copy) v_u_14
	if p34 then
		local v35 = v_u_6.Character
		if v35 then
			local v36 = v35:FindFirstChildOfClass("Humanoid")
			if v36 and v36.Health > 0 then
				if p34.Tool then
					local v37 = p34.Tool
					if not (v37 and v37.Parent) then
						return
					end
					if not v_u_16:IsRod(v37) then
						if v37.Parent == v35 then
							v36:UnequipTools()
						else
							v36:UnequipTools()
							v36:EquipTool(v37)
						end
					end
					if v_u_13 then
						local v38 = v37.Parent == v35
						v_u_13:FireServer(v37.Name, not v38)
						return
					end
				elseif p34.FishData and v_u_14 then
					local v39 = p34.FishData.uniqueId
					local v40 = false
					for _, v41 in ipairs(v35:GetChildren()) do
						if not v41:IsA("Tool") or v41:GetAttribute("FishId") ~= v39 then
							continue
						end
						v40 = true
					end
					v36:UnequipTools()
					v_u_14:FireServer(v39, not v40)
				end
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_45(p43) -- name: OnSlotDoubleClicked
	-- upvalues: (copy) v_u_15, (copy) v_u_27
	if p43 and p43.FishData then
		local v44 = v_u_15:InvokeServer(p43.FishData.uniqueId)
		p43.FishData.isFavorited = v44
		v_u_27()
	end
end
local function v_u_54() -- name: WaitForPlayerReady
	-- upvalues: (ref) v_u_18, (copy) v_u_16, (copy) v_u_6, (copy) v_u_5, (copy) v_u_27
	v_u_18 = false
	v_u_16:ResetState()
	if not v_u_6.Character then
		v_u_6.CharacterAdded:Wait()
	end
	local v46 = v_u_6.Character
	v46:WaitForChild("Humanoid", 10)
	local v47 = v_u_6:WaitForChild("Backpack", 10)
	local v48 = 0
	local v49 = false
	while v48 < 5 do
		local v50 = {}
		for _, v51 in ipairs(v47:GetChildren()) do
			table.insert(v50, v51)
		end
		for _, v52 in ipairs(v46:GetChildren()) do
			table.insert(v50, v52)
		end
		for _, v53 in ipairs(v50) do
			if not (v53:IsA("Tool") and (v53.Name:lower():find("rod") or (v53:GetAttribute("IsRod") or v_u_5:HasTag(v53, "Rod")))) then
				continue
			end
			v49 = true
		end
		if v49 then
			break
		end
		v48 = v48 + 0.1
		task.wait(0.1)
	end
	task.wait(0.5)
	v_u_18 = true
	v_u_27()
end
(function() -- name: Init
	-- upvalues: (copy) v_u_7, (ref) v_u_17, (copy) v_u_11, (copy) v_u_42, (copy) v_u_31, (copy) v_u_45, (copy) v_u_33, (copy) v_u_12, (copy) v_u_4, (copy) v_u_27, (copy) v_u_2, (copy) v_u_6, (ref) v_u_19, (ref) v_u_18, (copy) v_u_9, (copy) v_u_54
	local v55 = v_u_7:WaitForChild("BackpackGui")
	v_u_17 = v_u_11.new(v55, v_u_42, v_u_31, v_u_45, v_u_33)
	v_u_12.new():setName("InventoryToggle"):setImage("rbxassetid://14006782556", "Selected"):setImage("rbxassetid://14006782556", "Deselected"):setCaption("Inventory"):bindToggleKey(Enum.KeyCode.Backquote):setOrder(-1).toggled:Connect(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_17, (ref) v_u_27
		if not v_u_4.MenuIsOpen and v_u_17:ToggleInventory() then
			v_u_27()
		end
	end)
	local v56 = {
		Enum.KeyCode.One,
		Enum.KeyCode.Two,
		Enum.KeyCode.Three,
		Enum.KeyCode.Four,
		Enum.KeyCode.Five,
		Enum.KeyCode.Six,
		Enum.KeyCode.Seven,
		Enum.KeyCode.Eight,
		Enum.KeyCode.Nine,
		Enum.KeyCode.Zero
	}
	for v_u_57, v58 in ipairs(v56) do
		v_u_2:BindAction("Hotbar_Select_" .. v_u_57, function(_, p59)
			-- upvalues: (ref) v_u_42, (ref) v_u_17, (copy) v_u_57
			if p59 == Enum.UserInputState.Begin then
				v_u_42(v_u_17.HotbarSlots[v_u_57])
			end
		end, false, v58)
	end
	v_u_6:GetAttributeChangedSignal("EquippedRod"):Connect(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_18, (ref) v_u_27
		if not v_u_19 then
			v_u_19 = true
			task.delay(0.25, function()
				-- upvalues: (ref) v_u_18, (ref) v_u_27, (ref) v_u_19
				if v_u_18 then
					v_u_27()
				end
				v_u_19 = false
			end)
		end
	end)
	if v_u_9:FindFirstChild("Inventory_FishAdded") then
		v_u_9.Inventory_FishAdded.OnClientEvent:Connect(function()
			-- upvalues: (ref) v_u_18, (ref) v_u_19, (ref) v_u_27
			if v_u_18 then
				if not v_u_19 then
					v_u_19 = true
					task.delay(0.25, function()
						-- upvalues: (ref) v_u_18, (ref) v_u_27, (ref) v_u_19
						if v_u_18 then
							v_u_27()
						end
						v_u_19 = false
					end)
				end
			else
				return
			end
		end)
	end
	v_u_6.CharacterAdded:Connect(function()
		-- upvalues: (ref) v_u_54
		task.spawn(v_u_54)
	end)
	local v60 = v_u_6:WaitForChild("Backpack")
	v60.ChildAdded:Connect(function(p61)
		-- upvalues: (ref) v_u_18, (ref) v_u_6, (ref) v_u_19, (ref) v_u_27
		if v_u_18 then
			if p61.Parent == v_u_6.Character then
				return
			elseif not v_u_19 then
				v_u_19 = true
				task.delay(0.25, function()
					-- upvalues: (ref) v_u_18, (ref) v_u_27, (ref) v_u_19
					if v_u_18 then
						v_u_27()
					end
					v_u_19 = false
				end)
			end
		else
			return
		end
	end)
	v60.ChildRemoved:Connect(function(p62)
		-- upvalues: (ref) v_u_18, (ref) v_u_6, (ref) v_u_19, (ref) v_u_27
		if v_u_18 then
			if p62.Parent == v_u_6.Character then
				return
			elseif not v_u_19 then
				v_u_19 = true
				task.delay(0.25, function()
					-- upvalues: (ref) v_u_18, (ref) v_u_27, (ref) v_u_19
					if v_u_18 then
						v_u_27()
					end
					v_u_19 = false
				end)
			end
		else
			return
		end
	end)
	task.spawn(v_u_54)
end)()