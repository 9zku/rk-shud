---@class config
---@field framework string
---@field seatbelt string
---@field commands Commands

---@class Commands
---@field hide string
---@field show string

---@type config
config = {
    ---@type "esx" | "ox" | "qb" | "qbx" Supported Frameworks: esx, ox, qb, qbx,
    framework = 'esx',

    ---@type "default" | "esx" | "qbx" | "qb" Options: 'default' (built-in logic), 'esx' (esx_cruisecontrol), 'qbx' (qbx_seatbelt), or 'qb' (qb-smallresources)
    seatbelt = 'default',

    ---@type Commands
    commands = {
        hide = 'hidehud',
        show = 'showhud',
    }
}