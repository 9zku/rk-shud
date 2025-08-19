local PlayerStatus = {}


local Framework = require("client.framework." .. config.framework)

---@return boolean
function PlayerStatus:start()
    CreateThread(function()
        while true do
            local ped = cache.ped

            local health = GetEntityHealth(ped) - 100
            local armor = GetPedArmour(ped)
            local stamina = GetPlayerStamina(PlayerId())

            local hunger = Framework:GetPlayerStatus(ped, 'hunger')
            local thirst = Framework:GetPlayerStatus(ped, 'thirst')
        
            SendNUIMessage({
                action = 'updatePlayerStatus',
                data = {
                    health = health,
                    armour = armor,
                    stamina = stamina,
                    hunger = hunger,
                    thirst = thirst,
                }
            })

            Wait(800)
        end
    end)
    
    return true
end

return PlayerStatus