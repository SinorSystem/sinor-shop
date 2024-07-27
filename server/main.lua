local QBCore = nil

QBCore = exports[Config.CoreGetCoreObject]:GetCoreObject()

RegisterNetEvent("sinor:logShopInteraction")
AddEventHandler("sinor:logShopInteraction", function(shop, item)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)

    if not xPlayer then return end

    local playerName = GetPlayerName(_source)
    local fullName = xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    local discord = GetDiscordIdentifier(_source)
    local steamId = GetPlayerIdentifierByType(_source, "steam")
    local steamURL = steamId and "https://steamcommunity.com/profiles/" .. string.sub(steamId, 7) or "N/A"
    local timestamp = os.date("%Y/%m/%d") .. " / TIME : [" .. os.date("%X") .. "]"

    local description = string.format([[
**DATE : [ %s ]**

**PLAYER INFORMATION**

**Player :** %s

**Full Name RP :** %s

**Citizenid:** %s | **ID:** %d

**Discord :** ||%s||

**Steam ID:** ||%s||

**Steam URL:** ||%s||
]], timestamp, playerName, fullName, citizenid, _source, discord, steamId or "N/A", steamURL)

    -- Send log to Discord
    if Config.Webhook and Config.Webhook ~= "" then
        PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({
            username = "Sinor Shops",
            embeds = {{
                color = 16711680,
                title = "Used Shop",
                description = description,
                footer = { text = "Shop Logs" }
            }},
        }), { ['Content-Type'] = 'application/json' })
    end
end)

function GetDiscordIdentifier(source)
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            return "<@" .. string.sub(v, 9) .. ">"
        end
    end
    return "Not Found"
end

function GetPlayerIdentifierByType(source, idType)
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len(idType .. ":")) == idType .. ":" then
            return v
        end
    end
    return nil
end
