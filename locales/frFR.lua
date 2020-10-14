-- Contributors: Daniel8513@Curse

local _, addonTable = ...
local L = addonTable.L

-- Lua
local _G = getfenv(0)

if GetLocale() ~= "frFR" then return end

--[[ L["ANCHOR_FRAME_#"] = "Anchor Frame #%d" ]]
--[[ L["ANCHOR_FRAMES"] = "Anchor Frames" ]]
--[[ L["ANCHOR_RESET_DESC"] = "|cffffffffShift-Click|r to reset the position." ]]
L["BORDER"] = "Bordure"
L["COLORS"] = "Couleurs"
L["COORDS"] = "Coordonnées"
L["COPPER_THRESHOLD"] = "Seuil (en pièces de cuivre)"
L["COPPER_THRESHOLD_DESC"] = "Seuil minimum en pièce de cuivre permettant de générer un 'Toast'"
--[[ L["DEFAULT_VALUE"] = "Default value: |cffffd200%s|r" ]]
L["DND"] = "NPD"
L["DND_TOOLTIP"] = "Les 'Toast' en mode NPD (Ne Pas Déranger) ne s'afficheront pas en combat mais seront stockés dans le système. Quand le combat s'achève, les 'Toast' s'affichent."
L["FADE_OUT_DELAY"] = "Délai de disparition en fondu"
--[[ L["FLUSH_QUEUE"] = "Flush Queue" ]]
L["FONTS"] = "Polices"
L["GROWTH_DIR"] = "Sens d'affichage"
L["GROWTH_DIR_DOWN"] = "Bas"
L["GROWTH_DIR_LEFT"] = "Gauche"
L["GROWTH_DIR_RIGHT"] = "Droite"
L["GROWTH_DIR_UP"] = "Haut"
L["ICON_BORDER"] = "Bordure d'icône"
L["NAME"] = "Nom"
--[[ L["RARITY_THRESHOLD"] = "Rarity Threshold" ]]
L["SCALE"] = "Echelle"
L["SHOW_ILVL"] = "Montrer l'iLvl"
L["SHOW_ILVL_DESC"] = "Afficher le niveau de l'objet près de son nom"
L["SHOW_QUEST_ITEMS"] = "Montrer les objets de Quête"
L["SHOW_QUEST_ITEMS_DESC"] = "Montrer les objets de quête sans tenir compte de leur qualité"
L["SIZE"] = "Taille"
L["SKIN"] = "Apparence"
L["STRATA"] = "Strate"
L["TEST"] = "Test"
L["TEST_ALL"] = "Tester tout"
L["TOAST_NUM"] = "Nombre de 'Toast' simultanés"
L["TOAST_TYPES"] = "Types de 'Toast'"
--[[ L["TOGGLE_ANCHORS"] = "Toggle Anchors" ]]
--[[ L["TRACK_LOSS"] = "Track Loss" ]]
--[[ L["TRACK_LOSS_DESC"] = "This option ignores set copper threshold." ]]
L["TYPE_LOOT_GOLD"] = "Butin (Gold)"
--[[ L["X_OFFSET"] = "xOffset" ]]
--[[ L["Y_OFFSET"] = "yOffset" ]]
L["YOU_LOST"] = "Vous avez perdu"
L["YOU_RECEIVED"] = "Vous avez reçu"

-- Retail
L["COLLECTIONS_TAINT_WARNING"] = "Activer cette option peut provoquer des erreurs lors de l'ouverture de l'interface \"Collections\" en combat"
--[[ L["HANDLE_LEFT_CLICK"] = "Handle Left Click" ]]
L["OPEN_CONFIG"] = "Ouvrir Configuration"
L["TRANSMOG_ADDED"] = "Apparence ajoutée"
L["TRANSMOG_REMOVED"] = "Apparence retirée"
L["TYPE_ACHIEVEMENT"] = "Haut-Fait"
L["TYPE_ARCHAEOLOGY"] = "Archéologie"
L["TYPE_CLASS_HALL"] = "Hall de Classe"
L["TYPE_COLLECTION"] = "Collection"
L["TYPE_COLLECTION_DESC"] = "Toasts pour les nouveaux Compagnons, Jouets et Montures collectés."
L["TYPE_DUNGEON"] = "Donjon"
L["TYPE_GARRISON"] = "Fief"
L["TYPE_LOOT_COMMON"] = "Butin (Commun)"
L["TYPE_LOOT_COMMON_DESC"] = "Toasts générés par le tchat, ex: verts, bleus, certains épiques, tout ce que ne gère pas la fonction Toasts 'Butin (Special)'."
L["TYPE_LOOT_CURRENCY"] = "Butin (Breloques)"
L["TYPE_LOOT_SPECIAL"] = "Butin (Special)"
L["TYPE_LOOT_SPECIAL_DESC"] = "Toasts générés par les Butins spéciaux, ex: Jets de Butin, Butin Légendaire ou Personnel, etc."
L["TYPE_RECIPE"] = "Recettes"
--[[ L["TYPE_RUNECARVING"] = "Runecarving" ]]
L["TYPE_TRANSMOG"] = "Transmogrification"
--[[ L["TYPE_WAR_EFFORT"] = "War Effort" ]]
L["TYPE_WORLD_QUEST"] = "Missions d'expédition"
