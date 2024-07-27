***Sinor Shop Script***

- This script provides a configurable shop system for QBCore, allowing for easy customization and integration with your FiveM server. It supports both ped and prop models for shopkeepers and can log interactions to a Discord webhook.

## Features

- Configurable shops with ped or prop models.
- Integration with QBCore framework.
- Supports qb-inventory and qb-target and ox_target systems.
- Logs shop interactions to a Discord webhook.

## Shops Configuration

- Each shop can be configured with the following settings:

- coords: The coordinates of the shop.
- heading: The heading direction of the shopkeeper.
- model: Set to true for ped model, false for prop model.
- ped: Ped model name.
- prop: Prop model name.
- showBlip: Whether to show a blip on the map.
- blipSprite: Blip sprite ID.
- blipColor: Blip color ID.
- blipScale: Blip scale.
- blipDisplay: Blip display settings.
- blipLabel: Blip label text.
- items: Shop items configuration, including label, slots, and item details.

## Installation

- Download and place the script in your FiveM resources directory.
- Add the script to your server.cfg file:

  ```ensure sinor-shop```

## Logging

- Shop interactions are logged to the configured Discord webhook. Ensure you have set the correct webhook URL in the config.lua.

## Note 

- Am Using 'bzzz_prop_shop_locker' Prop Created By "BzZzi" You Can Find it In [here](https://forum.cfx.re/t/prop-shop-locker/5148437)