---@class VehicleState
local VehicleState = {}

local vehFunctions = require('client.utils.vehicle')
local seatbelt = require('client.belt.' .. config.seatbelt)

---@return boolean
function VehicleState:start()
    CreateThread(function()
        local wasInVehicle = false
        
        while true do
            local ped = cache.ped
            local vehicle = GetVehiclePedIsIn(ped, false)
            local inVehicle = vehicle ~= 0
            
            if inVehicle then
                if not wasInVehicle then
                    DisplayRadar(true)
                    vehFunctions:ToggleMinimap()
                    wasInVehicle = true
                end
                
                SendNUIMessage({
                    action = 'updateVehicleState',
                    data = { 
                        isInVehicle = true,
                        speed = GetEntitySpeed(vehicle) * 2.23,
                        fuel = GetVehicleFuelLevel(vehicle),
                        seatbelt = seatbelt:GetbeltState(),
                        health = vehFunctions:GetVehHealth(vehicle),
                        rpm = vehFunctions:ConvertRPM(vehicle),
                        streetName = select(1, vehFunctions:GetLocationInfo(GetEntityCoords(vehicle))),
                        areaName = select(2, vehFunctions:GetLocationInfo(GetEntityCoords(vehicle))),
                        direction = vehFunctions:GetDirection(GetEntityHeading(vehicle))
                    }
                })
            else
                if wasInVehicle then
                    DisplayRadar(false)
                    wasInVehicle = false
                end
                
                SendNUIMessage({
                    action = 'updateVehicleState',
                    data = { isInVehicle = false }
                })
            end
            
            Wait(500)
        end
    end)
    
    return true
end

return VehicleState
