local CoreObject = exports[Config.CoreGetCoreObject]:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

RegisterNetEvent("sinor:openShop")
AddEventHandler("sinor:openShop", function(data)
    local shop = data.shop
    local shopConfig = Config.Shops[shop]
    if shopConfig then
        if Config.InventorySystem == 'qb-inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", shop, shopConfig.items)
        end
        -- Example item details
        local item = {
            name = "example_item",
            amount = 1,
            price = 6500.0
        }
        TriggerServerEvent("sinor:logShopInteraction", shop, item)
    end
end)

CreateThread(function()
    for shop, data in pairs(Config.Shops) do
        if data.model then
            RequestModel(GetHashKey(data.ped))
            while not HasModelLoaded(GetHashKey(data.ped)) do
                Wait(1)
            end
            local ped = CreatePed(4, data.ped, data.coords.x, data.coords.y, data.coords.z - 1.0, data.heading, false, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        else
            RequestModel(GetHashKey(data.prop))
            while not HasModelLoaded(GetHashKey(data.prop)) do
                Wait(1)
            end
            local prop = CreateObject(GetHashKey(data.prop), data.coords.x, data.coords.y, data.coords.z - 1.0, false, false, false)
            SetEntityHeading(prop, data.heading)
            FreezeEntityPosition(prop, true)
        end

        if Config.TargetSystem == 'qb-target' then
            exports['qb-target']:AddBoxZone(shop, data.coords, 3, 3, {
                name = shop,
                heading = data.heading,
                debugPoly = false,
                minZ = data.coords.z - 1.5,
                maxZ = data.coords.z + 1.5
            }, {
                options = {
                    {
                        type = "client",
                        event = "sinor:openShop",
                        icon = "fa fa-shopping-cart",
                        label = "Shop",
                        shop = shop
                    }
                },
                distance = 2.5
            })
        elseif Config.TargetSystem == 'ox_target' then
            exports['ox_target']:addBoxZone({
                coords = data.coords,
                size = vec3(3, 3, 3),
                rotation = data.heading,
                debug = false,
                options = {
                    {
                        type = "client",
                        event = "sinor:openShop",
                        icon = "fa fa-shopping-cart",
                        label = "Shop",
                        shop = shop
                    }
                }
            })
        end

        if data.showBlip then
            local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
            SetBlipSprite(blip, data.blipSprite)
            SetBlipDisplay(blip, data.blipDisplay)
            SetBlipScale(blip, data.blipScale)
            SetBlipColour(blip, data.blipColor)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.blipLabel)
            EndTextCommandSetBlipName(blip)
        end
    end
end)
