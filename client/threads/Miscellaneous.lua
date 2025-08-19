local utils = require("client.utils.functions")

---@class MiscellaneousThreads
local MiscellaneousThreads = {}

---@return void
function MiscellaneousThreads:Minimap()
    CreateThread(function()
        while true do
            if not cache.vehicle then
                DisplayRadar(false)
                SetRadarBigmapEnabled(false, false)
            end
            Wait(2000)
        end
    end)
end

---@return void
function MiscellaneousThreads:HideHuds()
    CreateThread(function()
        while true do 
            if LocalPlayer.state.hudManualOverride then
                Wait(2000)
                goto continue
            end
            
            if IsPauseMenuActive() or utils:getInventoryStateBag() then
                SendNUIMessage({
                    action = 'hideHuds',
                    data = { hide = true }
                })
            else
                SendNUIMessage({
                    action = 'hideHuds',
                    data = { hide = false }
                })
            end
            
            ::continue::
            Wait(2000)
        end
    end)
end

---@return boolean
function MiscellaneousThreads:start()
    self:Minimap()
    self:HideHuds()

    return true
end

return MiscellaneousThreads