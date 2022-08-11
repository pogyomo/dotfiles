local function setup()
    -- Set style
    vim.g.sonokai_style = 'shusia'

    -- Disable italic and bold
    vim.g.sonokai_enable_italic           = false
    vim.g.sonokai_disable_italic_comment  = true
    vim.g.sonokai_lightline_disable_bold  = true

    -- Set virtual text color
    vim.g.sonokai_diagnostic_virtual_text = 'colored'

    -- Speed up
    vim.g.sonokai_better_performance = true

    -- Register colorscheme
    vim.cmd[[silent! colorscheme sonokai]]
end

return setup
