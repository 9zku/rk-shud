if config.framework ~= 'ox' then return end

local Framework = {}

---@class StatusData
---@field hunger number
---@field thirst number

---@class StatusValues
---@field hunger number
---@field thirst number

---@type StatusValues
local values = {
    hunger = 0,
    thirst = 0
}

AddEventHandler('ox:statusTick', function(data)
    Framework:updateStatusValues(data)
end)

---@param data StatusData
function Framework:updateStatusValues(data)
    values.hunger = 100 - data.hunger
    values.thirst = 100 - data.thirst
end

---@param player number
---@param statusName string
---@return number
function Framework:GetPlayerStatus(player, statusName)
    return values[statusName] or 0
end

return Framework
