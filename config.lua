Config = {}

-- Framework Settings
Config.Core = 'QBCore' -- Choose core QBCore Or Renamed ⚠️ Don't Choose Framework ESX or Another Framework
Config.CoreGetCoreObject = 'qb-core' -- qb-core or renamed 

-- Inventory and Target System Settings
Config.InventorySystem = "qb-inventory" -- Options: 'qb-inventory' or renamed 
Config.TargetSystem = "qb-target" -- Options: 'qb-target', 'ox_target'

-- Discord Webhook for Logging
Config.Webhook = "https://discord.com/api/webhooks/1265815042478313526/ydCi4Htg47o4mDhSYGuCZEpqvrHozj_xhlT2NNghKbqDtoSnjXgSprNk338fDPxLcMN1"

-- Shops Configuration
Config.Shops = {
    ['shop1'] = {
        coords = vector3(467.77, -842.19, 26.68),
        heading = 267.942,
        model = false, -- true for ped, false for prop
        ped = 'mp_m_shopkeep_01', -- Default ped model
        prop = 'bzzz_prop_shop_locker', -- Default prop model
        showBlip = true,
        blipSprite = 52,
        blipColor = 2,
        blipScale = 0.8,
        blipDisplay = 4,
        blipLabel = "Shop",
        items = {
            label = "Shop",
            slots = 2,
            items = {
                [1] = { name = 'bread', price = 10, amount = 50, info = {}, type = "item", slot = 1 },
                [2] = { name = 'water', price = 5, amount = 50, info = {}, type = "item", slot = 2 }
            }
        }
    },
    ['shop2'] = {
        coords = vector3(460.77, -840.19, 26.68),
        heading = 267.942,
        model = true, -- true for ped, false for prop
        ped = 'mp_m_shopkeep_01', -- Default ped model
        prop = 'bzzz_prop_shop_locker', -- Default prop model
        showBlip = true,
        blipSprite = 52,
        blipColor = 2,
        blipScale = 0.8,
        blipDisplay = 4,
        blipLabel = "Shop",
        items = {
            label = "Shop",
            slots = 2,
            items = {
                [1] = { name = 'lockpick', price = 200, amount = 50, info = {}, type = "item", slot = 1 },
                [2] = { name = 'repairkit', price = 250, amount = 50, info = {}, type = "item", slot = 2 }
            }
        }
    }
}
