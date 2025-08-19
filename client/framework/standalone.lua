if config.framework ~= 'standalone' then return end

local Framework = {}

---@param player number
---@param statusName string
---@return number
function Framework:GetPlayerStatus(player, statusName)
    return 100
end

return Framework
