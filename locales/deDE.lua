﻿-- Contributors: pas06@Curse, Ithilrandir@Curse

local _, addonTable = ...
local L = addonTable.L

-- Lua
local _G = getfenv(0)

if _G.GetLocale() ~= "deDE" then return end

L["ANCHOR"] = "Anker der Benachrichtigung"
L["ANCHOR_FRAME"] = "Anker Rahmen"
L["COLORS"] = "Farben"
L["COLORS_TOOLTIP"] = "Färbt Gegenstände und Anhängernamen nach Qualität und Weltquest- und Missionstitel nach Seltenheit."
-- L["COPPER_THRESHOLD"] = "Copper Threshold"
-- L["COPPER_THRESHOLD_DESC"] = "Min amount of copper to create a toast for."
L["DND"] = "DND"
L["DND_TOOLTIP"] = "Benachrichtigungen im DND-Modus werden nicht im Kampf angezeigt, sie werden jedoch in einer Warteschlange gesammelt. Sobald du den Kampf verlässt, werden sie auftauchen."
L["FADE_OUT_DELAY"] = "Ausblendungsverzögerung"
L["GROWTH_DIR"] = "Ausbreitungsrichtung"
L["GROWTH_DIR_DOWN"] = "Nach unten"
L["GROWTH_DIR_LEFT"] = "Nach links"
L["GROWTH_DIR_RIGHT"] = "Nach rechts"
L["GROWTH_DIR_UP"] = "Nach oben"
-- L["OPEN_CONFIG"] = "Open Config"
L["SCALE"] = "Skalierung"
L["SETTINGS_TYPE_LABEL"] = "Benachrichtigungstypen"
-- L["SKIN"] = "Skin"
L["TEST"] = "Test"
-- L["TEST_ALL"] = "Test All"
L["TOAST_NUM"] = "Anzahl der Benachrichtigungen"
L["TRANSMOG_ADDED"] = "Vorlage hinzugefügt"
L["TRANSMOG_REMOVED"] = "Vorlage entfernt"
L["TYPE_ACHIEVEMENT"] = "Erfolg"
L["TYPE_ARCHAEOLOGY"] = "Archäologie"
L["TYPE_CLASS_HALL"] = "Klassenhalle"
L["TYPE_DUNGEON"] = "Dungeon"
L["TYPE_GARRISON"] = "Garnison"
L["TYPE_LOOT_COMMON"] = "Beute (Gewöhnlich)"
L["TYPE_LOOT_COMMON_DESC"] = "Benachrichtigungen, die von Chatereignissen ausgelöst werden wie grüne, blaue Gegenstände, manche epischen Gegenstände, alles was nicht von der Benachrichtigung für besondere Beute abgedeckt wird."
L["TYPE_LOOT_CURRENCY"] = "Beute (Abzeichen)"
-- L["TYPE_LOOT_GOLD"] = "Loot (Gold)"
L["TYPE_LOOT_SPECIAL"] = "Beute (Spezial)"
L["TYPE_LOOT_SPECIAL_DESC"] = "Benachrichtigungen, die von besonderen Beuteereignissen wie gewonnene Würfe, legendäre Gegenstände, persönliche Beute etc. ausgelöst werden."
L["TYPE_RECIPE"] = "Rezept"
L["TYPE_TRANSMOG"] = "Transmogrifikation"
L["TYPE_WORLD_QUEST"] = "Weltquest"
