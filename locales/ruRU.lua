﻿-- Contributors: BLizzatron@Curse

local _, addonTable = ...
local L = addonTable.L

-- Lua
local _G = getfenv(0)

if _G.GetLocale() ~= "ruRU" then return end

L["ANCHOR"] = "Крепление уведомления"
L["ANCHOR_FRAME"] = "Фрейм крепления"
L["APPEARANCE_TITLE"] = "Внешний вид"
L["COLORS"] = "Окрашивать имена"
L["COLORS_TOOLTIP"] = "Окрашивать названия предметов и имена соратников в соответствии с качеством, а названия локальных заданий и миссий в соответствии с редкостью."
L["DND"] = "Не беспокоить"
L["DND_TOOLTIP"] = "Уведомления в режиме \"Не беспокоить\" не будут отображаться в бою, но будут добавлены в очередь. Они начнут появляться на Вашем экране, как только Вы покинете бой."
L["FADE_OUT_DELAY"] = "Задержка исчезновения"
L["GROWTH_DIR"] = "Направление роста"
L["GROWTH_DIR_DOWN"] = "Вниз"
L["GROWTH_DIR_LEFT"] = "Влево"
L["GROWTH_DIR_RIGHT"] = "Вправо"
L["GROWTH_DIR_UP"] = "Вверх"
L["PROFILE"] = "Профиль"
L["PROFILE_COPY_FROM"] = "Скопировать из:"
L["PROFILE_CREATE_NEW"] = "Создать новый профиль"
L["PROFILE_DELETE_CONFIRM"] = "Вы уверены, что хотите удалить профиль |cffffffff%s|r?"
L["PROFILE_RESET_CONFIRM"] = "Вы уверены, что хотите сбросить профиль |cffffffff%s|r?"
L["PROFILES_TITLE"] = "Профили"
L["SCALE"] = "Масштаб"
L["SETTINGS_GENERAL_DESC"] = "Настроечки, ага...\nЯ настоятельно рекомендую выполнить |cffe52626/перезагр|rузку интерфейса после того, как Вы закончили настройку аддона. Даже если Вы открыли и закрыли эту панель, ничего не меняя, |cffe52626/перезагр|rузите интерфейс. |cffffd200Таким образом Вы удалите это окно настроек из системы и предотвратите связанные с его наличием ошибки.|r"
L["SETTINGS_TYPE_DESC"] = "Ещё больше настроечек..."
L["SETTINGS_TYPE_LABEL"] = "Типы уведомлений"
L["TEST"] = "Тест"
L["TOAST_NUM"] = "Количество уведомлений"
L["TRANSMOG_ADDED"] = "Модель добавлена"
L["TRANSMOG_REMOVED"] = "Модель удалена"
L["TYPE"] = "Тип"
L["TYPE_ACHIEVEMENT"] = "Достижение"
L["TYPE_ARCHAEOLOGY"] = "Археология"
L["TYPE_CLASS_HALL"] = "Оплот класса"
L["TYPE_DUNGEON"] = "Подземелье"
L["TYPE_GARRISON"] = "Гарнизон"
L["TYPE_LOOT_COMMON"] = "Добыча (Обычная)"
L["TYPE_LOOT_COMMON_TOOLTIP"] = "Уведомления, вызванные событиями чата, например: необычные, редкие, некоторые эпические предметы, все то, что не показывается посредством уведомлений об особой добыче."
L["TYPE_LOOT_CURRENCY"] = "Добыча (Валюта)"
L["TYPE_LOOT_SPECIAL"] = "Добыча (Особая)"
L["TYPE_LOOT_SPECIAL_TOOLTIP"] = "Уведомления, вызванные специальными событиями добычи, например: выигранный розыгрыш добычи, легендарная или персональная добыча, и т. д."
L["TYPE_RECIPE"] = "Рецепт"
L["TYPE_TRANSMOG"] = "Трансмогрификация"
L["TYPE_WORLD_QUEST"] = "Локальное задание"
