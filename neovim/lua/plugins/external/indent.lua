local util = require('core.util')
local mods = util.requires{ 'indent_blankline' }
if util.is_empty(mods) then
    return
end

mods['indent_blankline'].setup()
