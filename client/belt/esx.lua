if config.seatbelt ~= 'esx' then return end

local seatbelt = {}

function seatbelt:GetbeltState()
    return exports["esx_cruisecontrol"]:isSeatbeltOn()
end

return seatbelt
