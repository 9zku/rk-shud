local PlayerStatus = require('client.threads.PlayerStatus')
local VehicleState = require('client.threads.VehicleState')
local Miscellaneous = require('client.threads.Miscellaneous')

PlayerStatus:start()
VehicleState:start()
Miscellaneous:start()

CreateThread(function()
    Wait(1000)
    SendNUIMessage({
        action = 'updateConfig',
        data = {
            framework = config.framework,
            commands = config.commands,
            features = {
                hunger = config.framework ~= 'standalone',
                thirst = config.framework ~= 'standalone',
                armour = true,
                stamina = true
            }
        }
    })
end)

RegisterCommand(config.commands.hide, function()
    LocalPlayer.state.hudManualOverride = true
    SendNUIMessage({
        action = 'hideHuds',
        data = { hide = true }
    })
end, false)

RegisterCommand(config.commands.show, function()
    LocalPlayer.state.hudManualOverride = false
    SendNUIMessage({
        action = 'showHuds',
        data = { hide = false }
    })
end, false)

