local utils = {}

---@param msg string
---@param type string
---@return void
function utils:notify(msg, type)
    lib.notify(
        {
            title = "HUD",
            description = msg,
            type = type
        }
    )
end

---@return boolean
function utils:getInventoryStateBag()
    if GetResourceState("ox_inventory") == "started" then
        return LocalPlayer.state.invOpen or false
    end

    if GetResourceState("qb-inventory") == "started" then
        return LocalPlayer.state.inv_busy or false
    end

    return LocalPlayer.state.invOpen or false
end

return utils