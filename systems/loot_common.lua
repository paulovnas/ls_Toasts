local _, addonTable = ...
local E, L, C = addonTable.E, addonTable.L, addonTable.C

-- Lua
local _G = getfenv(0)
local m_random = _G.math.random
local s_split = _G.string.split
local tonumber = _G.tonumber

-- Blizz
local C_PetJournal = _G.C_PetJournal
local C_Timer = _G.C_Timer

--[[ luacheck: globals
	BattlePetToolTip_Show GameTooltip GetItemInfo OpenBag UnitGUID

	ITEM_QUALITY_COLORS ITEM_QUALITY1_DESC ITEM_QUALITY2_DESC ITEM_QUALITY3_DESC ITEM_QUALITY4_DESC
	LOOT_ITEM_CREATED_SELF LOOT_ITEM_CREATED_SELF_MULTIPLE LOOT_ITEM_PUSHED_SELF LOOT_ITEM_PUSHED_SELF_MULTIPLE
	LOOT_ITEM_SELF LOOT_ITEM_SELF_MULTIPLE
]]

-- Mine
local PLAYER_GUID = UnitGUID("player")

local CACHED_LOOT_ITEM_CREATED
local CACHED_LOOT_ITEM_CREATED_MULTIPLE
local CACHED_LOOT_ITEM
local CACHED_LOOT_ITEM_MULTIPLE
local CACHED_LOOT_ITEM_PUSHED
local CACHED_LOOT_ITEM_PUSHED_MULTIPLE

local LOOT_ITEM_CREATED_PATTERN
local LOOT_ITEM_CREATED_MULTIPLE_PATTERN
local LOOT_ITEM_PATTERN
local LOOT_ITEM_MULTIPLE_PATTERN
local LOOT_ITEM_PUSHED_PATTERN
local LOOT_ITEM_PUSHED_MULTIPLE_PATTERN

local function updatePatterns()
	if CACHED_LOOT_ITEM_CREATED ~= LOOT_ITEM_CREATED_SELF then
		LOOT_ITEM_CREATED_PATTERN = LOOT_ITEM_CREATED_SELF:gsub("%%s", "(.+)"):gsub("^", "^")
		CACHED_LOOT_ITEM_CREATED = LOOT_ITEM_CREATED_SELF
	end

	if CACHED_LOOT_ITEM_CREATED_MULTIPLE ~= LOOT_ITEM_CREATED_SELF_MULTIPLE then
		LOOT_ITEM_CREATED_MULTIPLE_PATTERN = LOOT_ITEM_CREATED_SELF_MULTIPLE:gsub("%%s", "(.+)"):gsub("%%d", "(%%d+)"):gsub("^", "^")
		CACHED_LOOT_ITEM_CREATED_MULTIPLE = LOOT_ITEM_CREATED_SELF_MULTIPLE
	end

	if CACHED_LOOT_ITEM ~= LOOT_ITEM_SELF then
		LOOT_ITEM_PATTERN = LOOT_ITEM_SELF:gsub("%%s", "(.+)"):gsub("^", "^")
		CACHED_LOOT_ITEM = LOOT_ITEM_SELF
	end

	if CACHED_LOOT_ITEM_MULTIPLE ~= LOOT_ITEM_SELF_MULTIPLE then
		LOOT_ITEM_MULTIPLE_PATTERN = LOOT_ITEM_SELF_MULTIPLE:gsub("%%s", "(.+)"):gsub("%%d", "(%%d+)"):gsub("^", "^")
		CACHED_LOOT_ITEM_MULTIPLE = LOOT_ITEM_SELF_MULTIPLE
	end

	if CACHED_LOOT_ITEM_PUSHED ~= LOOT_ITEM_PUSHED_SELF then
		LOOT_ITEM_PUSHED_PATTERN = LOOT_ITEM_PUSHED_SELF:gsub("%%s", "(.+)"):gsub("^", "^")
		CACHED_LOOT_ITEM_PUSHED = LOOT_ITEM_PUSHED_SELF
	end

	if CACHED_LOOT_ITEM_PUSHED_MULTIPLE ~= LOOT_ITEM_PUSHED_SELF_MULTIPLE then
		LOOT_ITEM_PUSHED_MULTIPLE_PATTERN = LOOT_ITEM_PUSHED_SELF_MULTIPLE:gsub("%%s", "(.+)"):gsub("%%d", "(%%d+)"):gsub("^", "^")
		CACHED_LOOT_ITEM_PUSHED_MULTIPLE = LOOT_ITEM_PUSHED_SELF_MULTIPLE
	end

end

local function delayedUpdatePatterns()
	C_Timer.After(0.1, updatePatterns)
end

local function Toast_OnClick(self)
	if self._data.item_id then
		local bag = E:SearchBagsForItemID(self._data.item_id)
		if bag >= 0 then
			OpenBag(bag)
		end
	end
end

local function Toast_OnEnter(self)
	if self._data.tooltip_link then
		if self._data.tooltip_link:find("item") then
			GameTooltip:SetHyperlink(self._data.tooltip_link)
			GameTooltip:Show()
		elseif self._data.tooltip_link:find("battlepet") then
			local _, speciesID, level, breedQuality, maxHealth, power, speed = s_split(":", self._data.tooltip_link)
			BattlePetToolTip_Show(tonumber(speciesID), tonumber(level), tonumber(breedQuality), tonumber(maxHealth), tonumber(power), tonumber(speed))
		end
	end
end

local function PostSetAnimatedValue(self, value)
	self:SetText(value == 1 and "" or value)
end

local function Toast_SetUp(event, link, quantity)
	local sanitizedLink, originalLink, linkType, itemID = E:SanitizeLink(link)
	local toast, isNew, isQueued

	-- Check if there's a toast for this item from another event
	toast, isQueued = E:FindToast(nil, "item_id", itemID)
	if toast then
		if toast._data.event ~= event then
			return
		end
	else
		toast, isNew, isQueued = E:GetToast(event, "link", sanitizedLink)
	end

	if isNew then
		local name, quality, icon, _, classID, subClassID, bindType, isQuestItem

		if linkType == "battlepet" then
			local _, speciesID, _, breedQuality, _ = s_split(":", originalLink)
			name, icon = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
			quality = tonumber(breedQuality)
		else
			name, _, quality, _, _, _, _, _, _, icon, _, classID, subClassID, bindType = GetItemInfo(originalLink)
			isQuestItem = bindType == 4 or (classID == 12 and subClassID == 0)
		end

		if name and ((quality and quality >= C.db.profile.types.loot_common.threshold and quality <= 5)
			or (C.db.profile.types.loot_common.quest and isQuestItem)) then
			local color = ITEM_QUALITY_COLORS[quality] or ITEM_QUALITY_COLORS[1]

			toast.IconText1.PostSetAnimatedValue = PostSetAnimatedValue

			if quality >= C.db.profile.colors.threshold then
				if C.db.profile.colors.name then
					name = color.hex .. name .. "|r"
				end

				if C.db.profile.colors.border then
					toast.Border:SetVertexColor(color.r, color.g, color.b)
				end

				if C.db.profile.colors.icon_border then
					toast.IconBorder:SetVertexColor(color.r, color.g, color.b)
				end
			end

			if C.db.profile.types.loot_common.ilvl then
				local iLevel = E:GetItemLevel(originalLink)

				if iLevel > 0 then
					name = "[" .. color.hex .. iLevel .. "|r] " .. name
				end
			end

			if not toast.IconHL.isHidden then
				toast.IconHL:SetShown(isQuestItem)
			end

			toast.Title:SetText(L["YOU_RECEIVED"])
			toast.Text:SetText(name)
			toast.Icon:SetTexture(icon)
			toast.IconBorder:Show()
			toast.IconText1:SetAnimatedValue(quantity, true)

			toast._data.count = quantity
			toast._data.event = event
			toast._data.item_id = itemID
			toast._data.link = sanitizedLink
			toast._data.sound_file = C.db.profile.types.loot_common.sfx and 31578 -- SOUNDKIT.UI_EPICLOOT_TOAST
			toast._data.tooltip_link = originalLink

			toast:HookScript("OnClick", Toast_OnClick)
			toast:HookScript("OnEnter", Toast_OnEnter)
			toast:Spawn(C.db.profile.types.loot_common.anchor, C.db.profile.types.loot_common.dnd)
		else
			toast:Recycle()
		end
	else
		if isQueued then
			toast._data.count = toast._data.count + quantity
			toast.IconText1:SetAnimatedValue(toast._data.count, true)
		else
			toast._data.count = toast._data.count + quantity
			toast.IconText1:SetAnimatedValue(toast._data.count)

			toast.IconText2:SetText("+" .. quantity)
			toast.IconText2.Blink:Stop()
			toast.IconText2.Blink:Play()

			toast.AnimOut:Stop()
			toast.AnimOut:Play()
		end
	end
end

local function CHAT_MSG_LOOT(message, _, _, _, _, _, _, _, _, _, _, guid)
	if guid ~= PLAYER_GUID then
		return
	end

	local link, quantity = message:match(LOOT_ITEM_MULTIPLE_PATTERN)
	if not link then
		link, quantity = message:match(LOOT_ITEM_PUSHED_MULTIPLE_PATTERN)
		if not link then
			link, quantity = message:match(LOOT_ITEM_CREATED_MULTIPLE_PATTERN)
			if not link then
				quantity, link = 1, message:match(LOOT_ITEM_PATTERN)
				if not link then
					quantity, link = 1, message:match(LOOT_ITEM_PUSHED_PATTERN)
					if not link then
						quantity, link = 1, message:match(LOOT_ITEM_CREATED_PATTERN)
					end
				end
			end
		end
	end

	if not link then
		return
	end

	C_Timer.After(0.125, function() Toast_SetUp("CHAT_MSG_LOOT", link, tonumber(quantity) or 0) end)
end

local function Enable()
	updatePatterns()

	if C.db.profile.types.loot_common.enabled then
		E:RegisterEvent("CHAT_MSG_LOOT", CHAT_MSG_LOOT)
		E:RegisterEvent("PLAYER_ENTERING_WORLD", delayedUpdatePatterns)
	end
end

local function Disable()
	E:UnregisterEvent("CHAT_MSG_LOOT", CHAT_MSG_LOOT)
	E:UnregisterEvent("PLAYER_ENTERING_WORLD", delayedUpdatePatterns)
end

local function Test()
	-- item, Chaos Crystal
	local _, link = GetItemInfo(124442)
	if link then
		Toast_SetUp("COMMON_LOOT_TEST", link, m_random(9, 99))
	end

	-- battlepet, Anubisath Idol
	Toast_SetUp("COMMON_LOOT_TEST", "battlepet:1155:25:3:1725:276:244:0000000000000000", 1)
end

E:RegisterOptions("loot_common", {
	enabled = true,
	anchor = 1,
	dnd = false,
	sfx = true,
	ilvl = true,
	quest = false,
	threshold = 1,
}, {
	name = L["TYPE_LOOT_COMMON"],
	get = function(info)
		return C.db.profile.types.loot_common[info[#info]]
	end,
	set = function(info, value)
		C.db.profile.types.loot_common[info[#info]] = value
	end,
	args = {
		desc = {
			order = 1,
			type = "description",
			name = L["TYPE_LOOT_COMMON_DESC"],
		},
		enabled = {
			order = 2,
			type = "toggle",
			name = L["ENABLE"],
			set = function(_, value)
				C.db.profile.types.loot_common.enabled = value

				if value then
					Enable()
				else
					Disable()
				end
			end
		},
		dnd = {
			order = 3,
			type = "toggle",
			name = L["DND"],
			desc = L["DND_TOOLTIP"],
		},
		sfx = {
			order = 4,
			type = "toggle",
			name = L["SFX"],
		},
		ilvl = {
			order = 5,
			type = "toggle",
			name = L["SHOW_ILVL"],
			desc = L["SHOW_ILVL_DESC"],
		},
		threshold = {
			order = 6,
			type = "select",
			name = L["LOOT_THRESHOLD"],
			values = {
				[1] = ITEM_QUALITY_COLORS[1].hex .. ITEM_QUALITY1_DESC .. "|r",
				[2] = ITEM_QUALITY_COLORS[2].hex .. ITEM_QUALITY2_DESC .. "|r",
				[3] = ITEM_QUALITY_COLORS[3].hex .. ITEM_QUALITY3_DESC .. "|r",
				[4] = ITEM_QUALITY_COLORS[4].hex .. ITEM_QUALITY4_DESC .. "|r",
			},
		},
		quest = {
			order = 7,
			type = "toggle",
			name = L["SHOW_QUEST_ITEMS"],
			desc = L["SHOW_QUEST_ITEMS_DESC"],
		},
		test = {
			type = "execute",
			order = 99,
			width = "full",
			name = L["TEST"],
			func = Test,
		},
	},
})

E:RegisterSystem("loot_common", Enable, Disable, Test)
