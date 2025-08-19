---@class VehicleFunctions

local vehFunctions = {} 

---@param vehicle integer
---@return integer
function vehFunctions:GetVehHealth(vehicle)
    local health = GetVehicleBodyHealth(vehicle)
    return math.floor((health / 1000) * 100)
end

---@param vehicle integer
---@return integer
function vehFunctions:ConvertRPM(vehicle)
    local rpm = GetVehicleCurrentRpm(vehicle)
    return math.floor(rpm * 100)
end

---@param heading number
---@return string
function vehFunctions:GetDirection(heading)
    heading = heading % 360

    if heading < 22.5 or heading >= 337.5 then
        return "N"
    elseif heading < 67.5 then
        return "NE"
    elseif heading < 112.5 then
        return "E"
    elseif heading < 157.5 then
        return "SE"
    elseif heading < 202.5 then
        return "S"
    elseif heading < 247.5 then
        return "SW"
    elseif heading < 292.5 then
        return "W"
    else
        return "NW"
    end
end

---@param coords vector3
---@return string, string
function vehFunctions:GetLocationInfo(coords)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    local areaName = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    
    return streetName, areaName
end

---@return void
function vehFunctions:ToggleMinimap()
    local defaultAspectRatio = 1920 / 1080
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapOffset = 0

    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio - aspectRatio) / 3.6) - 0.008
    end

    RequestStreamedTextureDict("squaremap", false)

    while not HasStreamedTextureDictLoaded("squaremap") do Wait(100) end

    SetMinimapClipType(0)
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap",
                      "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap",
                      "radarmasksm")

    local yOffset = -0.005

    SetMinimapComponentPosition("minimap", "L", "B", -0.005 + minimapOffset,
                                yOffset, 0.158, 0.183)
    SetMinimapComponentPosition("minimap_mask", "L", "B",
                                -0.005 + minimapOffset, yOffset + 0.037, 0.142,
                                0.20)
    SetMinimapComponentPosition("minimap_blur", "L", "B",
                                -0.015 + minimapOffset, yOffset + 0.062, 0.272,
                                0.300)

    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetBigmapActive(true, false)
    SetMinimapClipType(0)

    local timeout = 0
    while true do
        SetBigmapActive(false, false)
        if timeout >= 1000 then
            break
        else
            timeout = timeout + 500
        end
        Wait(100)
    end
end

return vehFunctions
