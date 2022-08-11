local function setup()
    local util = require('collection.util')
    local mods = util.requires{ 'notify' }
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
