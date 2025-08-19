if config.framework ~= 'qb' then return end

local QBCore = exports['qb-core']:GetCoreObject()

local Framework = {}

---@param player number
---@param statusName string
---@return number
function Framework:GetPlayerStatus(player, statusName)
    local playerData = QBCore.Functions.GetPlayerData()
    
    if playerData and playerData.metadata then
        if statusName == 'hunger' then
            return math.floor(playerData.metadata.hunger)
        elseif statusName == 'thirst' then
            return math.floor(playerData.metadata.thirst)
        end
    end
    
    return 0
end

return Framework
