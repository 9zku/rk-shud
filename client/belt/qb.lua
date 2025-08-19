if config.seatbelt ~= 'qb' then return end

local seatbelt = {}

function seatbelt:GetbeltState()
    return exports["qb-smallresources"]:HasSeatbeltOn() or exports["qb-smallresources"]:HasHarness()
end

return seatbelt
