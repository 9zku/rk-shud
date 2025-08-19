if config.seatbelt ~= 'qbx' then return end

local seatbelt = {}

function seatbelt:GetbeltState()
    return (LocalPlayer.state.seatbelt or false) or (LocalPlayer.state.harness or false)
end

return seatbelt
