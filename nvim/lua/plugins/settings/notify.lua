local function setup()
    local util = require('utils')
    local mods = util.requires('notify')
    if util.is_empty(mods) then
        return
    end

    mods['notify'].setup{
        fps = 60,
        stages = 'fade',
    }
    vim.notify = mods['notify']
end

return setup
