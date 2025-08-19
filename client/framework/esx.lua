if config.framework ~= 'esx' then return end

local Framework = {}

---@class StatusData
---@field name string
---@field percent number

---@class StatusValues
---@field hunger number
---@field thirst number

---@type StatusValues
local values = {
    hunger = 0,
    thirst = 0
}

AddEventHandler('esx_status:onTick', function(data)
    Framework:updateStatusValues(data)
end)

---@param data StatusData[]
function Framework:updateStatusValues(data)
    for i = 1, #data do
        local status = data[i]
        local statusName = status.name
        
        if values[statusName] then
            values[statusName] = math.floor(status.percent)
        end
    end
end

---@param player number
---@param statusName string
---@return number
function Framework:GetPlayerStatus(player, statusName)
    return values[statusName] or 0
end

return Framework